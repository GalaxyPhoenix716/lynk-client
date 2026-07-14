import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/receiver_session.dart';

part 'receiver_session_model.freezed.dart';
part 'receiver_session_model.g.dart';

@freezed
abstract class ReceiverSessionModel with _$ReceiverSessionModel {
  const factory ReceiverSessionModel({
    @JsonKey(name: 'session_id') required String id,
    required ReceiverSessionStatus status,
    @JsonKey(name: 'transfer_id') String? transferId,
    @JsonKey(name: 'expires_in') int? expiresMultiplier,
  }) = _ReceiverSessionModel;

  factory ReceiverSessionModel.fromJson(Map<String, dynamic> json) => _$ReceiverSessionModelFromJson(json);

  factory ReceiverSessionModel.fromEntity(ReceiverSession entity) {
    return ReceiverSessionModel(
      id: entity.id,
      status: entity.status,
      transferId: entity.transferId,
      expiresMultiplier: entity.expiresMultiplier,
    );
  }
}

extension ReceiverSessionModelX on ReceiverSessionModel {
  ReceiverSession toEntity() {
    return ReceiverSession(
      id: id,
      status: status,
      transferId: transferId,
      expiresMultiplier: expiresMultiplier,
    );
  }
}
