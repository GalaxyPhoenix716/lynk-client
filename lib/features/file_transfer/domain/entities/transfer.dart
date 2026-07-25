import 'package:equatable/equatable.dart';
import 'file_item.dart';

enum TransferStatus { uploading, ready, expired, cancelled }

class Transfer extends Equatable {
  final String id;
  final TransferStatus status;
  final int totalFiles;
  final int totalSize;
  final int? expiresMultiplier;
  final DateTime? createdAt;
  final List<FileItem> files;

  const Transfer({
    required this.id,
    required this.status,
    required this.totalFiles,
    required this.totalSize,
    this.expiresMultiplier,
    this.createdAt,
    required this.files,
  });

  Transfer copyWith({
    String? id,
    TransferStatus? status,
    int? totalFiles,
    int? totalSize,
    int? expiresMultiplier,
    DateTime? createdAt,
    List<FileItem>? files,
  }) {
    return Transfer(
      id: id ?? this.id,
      status: status ?? this.status,
      totalFiles: totalFiles ?? this.totalFiles,
      totalSize: totalSize ?? this.totalSize,
      expiresMultiplier: expiresMultiplier ?? this.expiresMultiplier,
      createdAt: createdAt ?? this.createdAt,
      files: files ?? this.files,
    );
  }

  @override
  List<Object?> get props => [
    id,
    status,
    totalFiles,
    totalSize,
    expiresMultiplier,
    createdAt,
    files,
  ];
}
