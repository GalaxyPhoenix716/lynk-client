import 'package:client/features/file_transfer/domain/entities/file_item.dart';
import 'package:client/features/file_transfer/domain/entities/transfer.dart';
import 'package:equatable/equatable.dart';

enum DownloadPhase { idle, preview, downloading, completed, failed, cancelled }

class DownloadState extends Equatable {
  final Transfer? transfer;
  final List<FileItem> downloadFiles;
  final int currentFileIndex;
  final double currentFileProgress;
  final double overallProgress;
  final DownloadPhase phase;
  final List<String> downloadedPaths;
  final String? errorMessage;
  const DownloadState({
    this.transfer,
    this.downloadFiles = const [],
    this.currentFileIndex = 0,
    this.currentFileProgress = 0.0,
    this.overallProgress = 0.0,
    this.phase = DownloadPhase.idle,
    this.downloadedPaths = const [],
    this.errorMessage,
  });
  DownloadState copyWith({
    Transfer? transfer,
    List<FileItem>? downloadFiles,
    int? currentFileIndex,
    double? currentFileProgress,
    double? overallProgress,
    DownloadPhase? phase,
    List<String>? downloadedPaths,
    String? errorMessage,
  }) {
    return DownloadState(
      transfer: transfer ?? this.transfer,
      downloadFiles: downloadFiles ?? this.downloadFiles,
      currentFileIndex: currentFileIndex ?? this.currentFileIndex,
      currentFileProgress: currentFileProgress ?? this.currentFileProgress,
      overallProgress: overallProgress ?? this.overallProgress,
      phase: phase ?? this.phase,
      downloadedPaths: downloadedPaths ?? this.downloadedPaths,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    transfer,
    downloadFiles,
    currentFileIndex,
    currentFileProgress,
    overallProgress,
    phase,
    downloadedPaths,
    errorMessage,
  ];
}
