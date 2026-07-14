// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileItemModel _$FileItemModelFromJson(Map<String, dynamic> json) =>
    _FileItemModel(
      id: json['file_id'] as String,
      name: json['file_name'] as String,
      size: (json['file_size'] as num).toInt(),
      contentType: json['content_type'] as String,
      status: $enumDecode(_$FileStatusEnumMap, json['status']),
      uploadUrl: json['upload_url'] as String?,
      downloadUrl: json['download_url'] as String?,
    );

Map<String, dynamic> _$FileItemModelToJson(_FileItemModel instance) =>
    <String, dynamic>{
      'file_id': instance.id,
      'file_name': instance.name,
      'file_size': instance.size,
      'content_type': instance.contentType,
      'status': _$FileStatusEnumMap[instance.status]!,
      'upload_url': instance.uploadUrl,
      'download_url': instance.downloadUrl,
    };

const _$FileStatusEnumMap = {
  FileStatus.pending: 'pending',
  FileStatus.uploaded: 'uploaded',
  FileStatus.failed: 'failed',
};
