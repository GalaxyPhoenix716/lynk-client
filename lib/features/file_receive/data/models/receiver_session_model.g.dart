// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiverSessionModel _$ReceiverSessionModelFromJson(
  Map<String, dynamic> json,
) => _ReceiverSessionModel(
  id: json['session_id'] as String,
  status: $enumDecode(_$ReceiverSessionStatusEnumMap, json['status']),
  transferId: json['transfer_id'] as String?,
  expiresMultiplier: (json['expires_in'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReceiverSessionModelToJson(
  _ReceiverSessionModel instance,
) => <String, dynamic>{
  'session_id': instance.id,
  'status': _$ReceiverSessionStatusEnumMap[instance.status]!,
  'transfer_id': instance.transferId,
  'expires_in': instance.expiresMultiplier,
};

const _$ReceiverSessionStatusEnumMap = {
  ReceiverSessionStatus.waiting: 'waiting',
  ReceiverSessionStatus.attached: 'attached',
  ReceiverSessionStatus.expired: 'expired',
};
