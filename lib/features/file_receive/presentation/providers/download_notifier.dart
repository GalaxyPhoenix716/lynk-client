import 'package:client/core/providers/transfer_providers.dart';
import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/download_service.dart';
import 'download_state.dart';

part 'download_notifier.g.dart';

@riverpod
DownloadService downloadService(Ref ref) => DownloadService();

@riverpod
class DownloadNotifier extends _$DownloadNotifier {
  CancelToken? _cancelToken;

  @override
  DownloadState build() => const DownloadState();

  Future<void> loadTransferPreview(String transferId) async {
    state = const DownloadState(phase: DownloadPhase.idle);
    final repo = ref.read(transferRepositoryProvider);
    final result = await repo.getTransferMetadata(transferId);

    result.fold(
      (transfer) => state = state.copyWith(transfer: transfer, phase: DownloadPhase.preview),
      (failure) => state = state.copyWith(phase: DownloadPhase.failed, errorMessage: failure.message),
    );
  }

  Future<void> startDownload() async {
    if (state.transfer == null) return;

    state = state.copyWith(phase: DownloadPhase.downloading, currentFileIndex: 0, overallProgress: 0.0);
    _cancelToken = CancelToken();

    final repo = ref.read(transferRepositoryProvider);
    final downloadService = ref.read(downloadServiceProvider);

    final urlResult = await repo.getDownloadUrls(transferId: state.transfer!.id);
    
    urlResult.fold(
      (downloadFiles) async {
        state = state.copyWith(downloadFiles: downloadFiles);
        final dir = await getApplicationDocumentsDirectory();
        final downloadedPaths = <String>[];
        int cumulativeBytes = 0;
        final totalSize = state.transfer!.totalSize;

        for (int i = 0; i < downloadFiles.length; i++) {
          if (_cancelToken?.isCancelled ?? false) return;

          final item = downloadFiles[i];
          final savePath = '${dir.path}/${item.name}';

          state = state.copyWith(currentFileIndex: i, currentFileProgress: 0.0);

          try {
            await downloadService.downloadFileFromR2(
              downloadUrl: item.downloadUrl!,
              savePath: savePath,
              cancelToken: _cancelToken,
              onProgress: (received, total) {
                final fileProgress = total > 0 ? received / total : 0.0;
                final overall = totalSize > 0 ? (cumulativeBytes + received) / totalSize : 0.0;
                state = state.copyWith(
                  currentFileProgress: fileProgress,
                  overallProgress: overall.clamp(0.0, 1.0),
                );
              },
            );

            downloadedPaths.add(savePath);
            cumulativeBytes += item.size;
          } catch (e) {
            if (_cancelToken?.isCancelled ?? false) return;
            state = state.copyWith(phase: DownloadPhase.failed, errorMessage: 'Failed downloading ${item.name}');
            return;
          }
        }

        state = state.copyWith(
          phase: DownloadPhase.completed,
          overallProgress: 1.0,
          downloadedPaths: downloadedPaths,
        );
      },
      (failure) {
        state = state.copyWith(phase: DownloadPhase.failed, errorMessage: failure.message);
      },
    );
  }

  Future<void> openFile(String path) async {
    await OpenFilex.open(path);
  }

  void cancelDownload() {
    _cancelToken?.cancel();
    state = state.copyWith(phase: DownloadPhase.cancelled);
  }
}