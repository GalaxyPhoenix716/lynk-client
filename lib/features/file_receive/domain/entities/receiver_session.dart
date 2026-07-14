import 'package:freezed_annotation/freezed_annotation.dart';

part 'receiver_session.freezed.dart';

enum ReceiverSessionStatus { waiting, attached, expired }

@freezed
abstract class ReceiverSession with _$ReceiverSession {
  const factory ReceiverSession({
    required String id,
    required ReceiverSessionStatus status,
    String? transferId,
    int? expiresMultiplier,
  }) = _ReceiverSession;
}
