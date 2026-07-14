import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/file_item.dart';

part 'file_item_model.freezed.dart';
part 'file_item_model.g.dart';

@freezed
abstract class FileItemModel with _$FileItemModel {
  const factory FileItemModel({
    @JsonKey(name: 'file_id') required String id,
    @JsonKey(name: 'file_name') required String name,
    @JsonKey(name: 'file_size') required int size,
    @JsonKey(name: 'content_type') required String contentType,
    required FileStatus status,
    @JsonKey(name: 'upload_url') String? uploadUrl,
    @JsonKey(name: 'download_url') String? downloadUrl,
  }) = _FileItemModel;

  factory FileItemModel.fromJson(Map<String, dynamic> json) => _$FileItemModelFromJson(json);

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
extension FileItemModelX on FileItemModel {
  FileItem toEntity() {
    return FileItem(
      id: id,
      name: name,
      size: size,
      contentType: contentType,
      status: status,
      uploadUrl: uploadUrl,
      downloadUrl: downloadUrl,
    );
  }
}
