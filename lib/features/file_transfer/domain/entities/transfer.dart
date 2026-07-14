import 'package:equatable/equatable.dart';
import 'file_item.dart';

enum TransferStatus { uploading, ready, expired, cancelled }

class Transfer extends Equatable {
  final String id;
  final TransferStatus status;
  final int totalFiles;
  final int totalSize;
  final int? expiresMultiplier;
  final List<FileItem> files;

  const Transfer({
    required this.id,
    required this.status,
    required this.totalFiles,
    required this.totalSize,
    this.expiresMultiplier,
    required this.files,
  });

  Transfer copyWith({
    String? id,
    TransferStatus? status,
    int? totalFiles,
    int? totalSize,
    int? expiresMultiplier,
    List<FileItem>? files,
  }) {
    return Transfer(
      id: id ?? this.id,
      status: status ?? this.status,
      totalFiles: totalFiles ?? this.totalFiles,
      totalSize: totalSize ?? this.totalSize,
      expiresMultiplier: expiresMultiplier ?? this.expiresMultiplier,
      files: files ?? this.files,
    );
  }

  @override
  List<Object?> get props => [id, status, totalFiles, totalSize, expiresMultiplier, files];
}
