import 'package:equatable/equatable.dart';

enum FileStatus { pending, uploaded, failed }

class FileItem extends Equatable {
  final String id;
  final String name;
  final int size;
  final String contentType;
  final FileStatus status;
  final String? uploadUrl;
  final String? downloadUrl;

  const FileItem({
    required this.id,
    required this.name,
    required this.size,
    required this.contentType,
    required this.status,
    this.uploadUrl,
    this.downloadUrl,
  });

  FileItem copyWith({
    String? id,
    String? name,
    int? size,
    String? contentType,
    FileStatus? status,
    String? uploadUrl,
    String? downloadUrl,
  }) {
    return FileItem(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      contentType: contentType ?? this.contentType,
      status: status ?? this.status,
      uploadUrl: uploadUrl ?? this.uploadUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, size, contentType, status, uploadUrl, downloadUrl];
}
