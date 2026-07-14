// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransferModel _$TransferModelFromJson(Map<String, dynamic> json) =>
    _TransferModel(
      id: json['transfer_id'] as String,
      status: $enumDecode(_$TransferStatusEnumMap, json['status']),
      totalFiles: (json['total_files'] as num).toInt(),
      totalSize: (json['total_size'] as num).toInt(),
      expiresMultiplier: (json['expires_in'] as num?)?.toInt(),
      files: (json['files'] as List<dynamic>)
          .map((e) => FileItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransferModelToJson(_TransferModel instance) =>
    <String, dynamic>{
      'transfer_id': instance.id,
      'status': _$TransferStatusEnumMap[instance.status]!,
      'total_files': instance.totalFiles,
      'total_size': instance.totalSize,
      'expires_in': instance.expiresMultiplier,
      'files': instance.files,
    };

const _$TransferStatusEnumMap = {
  TransferStatus.uploading: 'uploading',
  TransferStatus.ready: 'ready',
  TransferStatus.expired: 'expired',
  TransferStatus.cancelled: 'cancelled',
};
