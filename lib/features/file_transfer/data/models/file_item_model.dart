import '../../domain/entities/file_item.dart';

class FileItemModel extends FileItem {
  const FileItemModel({
    required super.id,
    required super.name,
    required super.size,
    required super.contentType,
    required super.status,
    super.uploadUrl,
    super.downloadUrl,
  });

  factory FileItemModel.fromJson(Map<String, dynamic> json) {
    FileStatus parseStatus(String? statusStr) {
      switch (statusStr) {
        case 'uploaded':
          return FileStatus.uploaded;
        case 'failed':
          return FileStatus.failed;
        case 'pending':
        default:
          return FileStatus.pending;
      }
    }

    return FileItemModel(
      id: json['file_id'] as String? ?? '',
      name: json['file_name'] as String? ?? '',
      size: json['file_size'] as int? ?? 0,
      contentType: json['content_type'] as String? ?? '',
      status: parseStatus(json['status'] as String?),
      uploadUrl: json['upload_url'] as String?,
      downloadUrl: json['download_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    String statusString(FileStatus s) {
      switch (s) {
        case FileStatus.uploaded:
          return 'uploaded';
        case FileStatus.failed:
          return 'failed';
        case FileStatus.pending:
          return 'pending';
      }
    }

    return {
      'file_id': id,
      'file_name': name,
      'file_size': size,
      'content_type': contentType,
      'status': statusString(status),
      if (uploadUrl != null) 'upload_url': uploadUrl,
      if (downloadUrl != null) 'download_url': downloadUrl,
    };
  }

  factory FileItemModel.fromEntity(FileItem entity) {
    return FileItemModel(
      id: entity.id,
      name: entity.name,
      size: entity.size,
      contentType: entity.contentType,
      status: entity.status,
      uploadUrl: entity.uploadUrl,
      downloadUrl: entity.downloadUrl,
    );
  }
}
