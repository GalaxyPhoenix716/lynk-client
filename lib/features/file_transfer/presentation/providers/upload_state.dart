import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../domain/entities/transfer.dart';

enum UploadPhase { idle, selecting, uploading, completed, failed, cancelled }

class UploadState extends Equatable {
  final List<PlatformFile> selectedFiles;
  final Transfer? transfer;
  final int currentFileIndex;
  final double currentFileProgress;
  final double overallProgress;
  final int bytesUploaded;
  final UploadPhase phase;
  final String? errorMessage;

  const UploadState({
    this.selectedFiles = const [],
    this.transfer,
    this.currentFileIndex = 0,
    this.currentFileProgress = 0.0,
    this.overallProgress = 0.0,
    this.bytesUploaded = 0,
    this.phase = UploadPhase.idle,
    this.errorMessage,
  });

  int get totalSize => selectedFiles.fold(0, (sum, f) => sum + f.size);

  UploadState copyWith({
    List<PlatformFile>? selectedFiles,
    Transfer? transfer,
    int? currentFileIndex,
    double? currentFileProgress,
    double? overallProgress,
    int? bytesUploaded,
    UploadPhase? phase,
    String? errorMessage,
  }) {
    return UploadState(
      selectedFiles: selectedFiles ?? this.selectedFiles,
      transfer: transfer ?? this.transfer,
      currentFileIndex: currentFileIndex ?? this.currentFileIndex,
      currentFileProgress: currentFileProgress ?? this.currentFileProgress,
      overallProgress: overallProgress ?? this.overallProgress,
      bytesUploaded: bytesUploaded ?? this.bytesUploaded,
      phase: phase ?? this.phase,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        selectedFiles,
        transfer,
        currentFileIndex,
        currentFileProgress,
        overallProgress,
        bytesUploaded,
        phase,
        errorMessage,
      ];
}
