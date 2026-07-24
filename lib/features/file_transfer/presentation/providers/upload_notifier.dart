import 'dart:io';
import 'dart:typed_data';
import 'package:client/core/providers/transfer_providers.dart';
import 'package:client/core/services/file_picker_service.dart';
import 'package:client/core/services/upload_service.dart';
import 'package:client/core/providers/receiver_providers.dart';
import 'package:client/core/utils/entropy_generator.dart';
import 'package:client/features/file_transfer/domain/entities/file_item.dart';
import 'package:client/features/file_transfer/domain/usecases/encrypt_file_use_case.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'upload_state.dart';

part 'upload_notifier.g.dart';

@riverpod
UploadService uploadService(Ref ref) => UploadService();

@riverpod
class UploadNotifier extends _$UploadNotifier {
  CancelToken? _cancelToken;

  @override
  UploadState build() => const UploadState();

  Future<void> pickFiles() async {
    final picker = ref.read(filePickerServiceProvider);
    final result = await picker.pickFiles(allowMultiple: true);
    if (result == null || result.files.isEmpty) return;

    final files = result.files;
    if (files.length > 10) {
      state = state.copyWith(
        phase: UploadPhase.failed,
        errorMessage: 'Maximum 10 files per transfer',
      );
      return;
    }

    final totalSize = files.fold(0, (sum, f) => sum + f.size);
    if (totalSize > 524288000) {
      state = state.copyWith(
        phase: UploadPhase.failed,
        errorMessage: 'Total transfer limit is 500 MB',
      );
      return;
    }

    for (var f in files) {
      if (f.size > 52428800) {
        state = state.copyWith(
          phase: UploadPhase.failed,
          errorMessage: 'File "${f.name}" exceeds 50 MB limit',
        );
        return;
      }
    }

    state = UploadState(selectedFiles: files, phase: UploadPhase.selecting);
  }

  void setFilesForTesting(List<PlatformFile> files) {
    state = UploadState(selectedFiles: files, phase: UploadPhase.selecting);
  }

  void removeFile(int index) {
    final updated = List<PlatformFile>.from(state.selectedFiles)
      ..removeAt(index);
    state = state.copyWith(
      selectedFiles: updated,
      phase: updated.isEmpty ? UploadPhase.idle : UploadPhase.selecting,
    );
  }

  Future<void> startUpload({String? attachToSessionId}) async {
    if (state.selectedFiles.isEmpty) return;

    state = state.copyWith(
      phase: UploadPhase.uploading,
      currentFileIndex: 0,
      overallProgress: 0.0,
    );
    _cancelToken = CancelToken();

    final repo = ref.read(transferRepositoryProvider);
    final uploadService = ref.read(uploadServiceProvider);
    final encryptUseCase = ref.read(encryptFileUseCaseProvider);

    // 1. Generate the dynamic entropy key (UUID + Temp + Timestamp)
    final aesKey = await EntropyGenerator.generateKey();
    state = state.copyWith(aesKey: aesKey);

    // 2. Map file items with exact encrypted sizes
    final fileItems = state.selectedFiles.map((f) {
      final encSize = ((f.size ~/ 16) + 1) * 16 + 16;
      return FileItem(
        id: '',
        name: f.name,
        size: encSize,
        contentType: 'application/octet-stream',
        status: FileStatus.pending,
      );
    }).toList();

    final createResult = await repo.createTransfer(fileItems);

    createResult.fold(
      (transfer) async {
        state = state.copyWith(transfer: transfer);
        int cumulativeBytes = 0;

        for (int i = 0; i < state.selectedFiles.length; i++) {
          if (_cancelToken?.isCancelled ?? false) return;

          final pFile = state.selectedFiles[i];
          final item = transfer.files[i];

          state = state.copyWith(currentFileIndex: i, currentFileProgress: 0.0);

          try {
            File? encryptedFile;
            Uint8List? encryptedBytes;

            if (pFile.path != null) {
              encryptedFile = await encryptUseCase.execute(
                inputFile: File(pFile.path!),
                aesKey32Bytes: aesKey,
              );
            } else if (pFile.bytes != null) {
              encryptedBytes = encryptUseCase.executeBytes(
                inputBytes: pFile.bytes!,
                aesKey32Bytes: aesKey,
              );
            } else {
              throw ArgumentError('File has no valid path or bytes payload');
            }

            final int encSize =
                encryptedBytes?.length ?? await encryptedFile!.length();

            await uploadService.uploadFileToR2(
              name: pFile.name,
              size: encSize,
              contentType: item.contentType,
              uploadUrl: item.uploadUrl!,
              file: encryptedFile,
              bytes: encryptedBytes,
              cancelToken: _cancelToken,
              onProgress: (sent, total) {
                final fileProgress = sent / total;
                final currentOverall =
                    (cumulativeBytes + sent) / state.totalSize;
                state = state.copyWith(
                  currentFileProgress: fileProgress,
                  overallProgress: currentOverall.clamp(0.0, 1.0),
                );
              },
            );

            // Clean up temp file on native platforms
            if (encryptedFile != null && await encryptedFile.exists()) {
              await encryptedFile.delete();
            }

            await repo.completeFileUpload(
              transferId: transfer.id,
              fileId: item.id,
            );
            cumulativeBytes += encSize;
          } catch (e) {
            if (_cancelToken?.isCancelled ?? false) return;
            state = state.copyWith(
              phase: UploadPhase.failed,
              errorMessage: 'Failed uploading ${pFile.name}: $e',
            );
            return;
          }
        }

        if (attachToSessionId != null) {
          final receiverRepo = ref.read(receiverRepositoryProvider);
          await receiverRepo.attachTransfer(
            sessionId: attachToSessionId,
            transferId: transfer.id,
          );
        }

        state = state.copyWith(
          phase: UploadPhase.completed,
          overallProgress: 1.0,
        );
      },
      (failure) async {
        state = state.copyWith(
          phase: UploadPhase.failed,
          errorMessage: failure.message,
        );
      },
    );
  }

  void cancelUpload() {
    _cancelToken?.cancel();
    if (state.transfer != null) {
      ref.read(transferRepositoryProvider).cancelTransfer(state.transfer!.id);
    }
    state = state.copyWith(phase: UploadPhase.cancelled);
  }
}
