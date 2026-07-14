import 'package:equatable/equatable.dart';

enum ReceiverSessionStatus { waiting, attached, expired }

class ReceiverSession extends Equatable {
  final String id;
  final ReceiverSessionStatus status;
  final String? transferId;
  final int? expiresMultiplier;

  const ReceiverSession({
    required this.id,
    required this.status,
    this.transferId,
    this.expiresMultiplier,
  });

  ReceiverSession copyWith({
    String? id,
    ReceiverSessionStatus? status,
    String? transferId,
    int? expiresMultiplier,
  }) {
    return ReceiverSession(
      id: id ?? this.id,
      status: status ?? this.status,
      transferId: transferId ?? this.transferId,
      expiresMultiplier: expiresMultiplier ?? this.expiresMultiplier,
    );
  }

  @override
  List<Object?> get props => [id, status, transferId, expiresMultiplier];
}
