import 'package:equatable/equatable.dart';

enum ReceiverSessionStatus { waiting, attached, expired }

class ReceiverSession extends Equatable {
  final String id;
  final ReceiverSessionStatus status;
  final String? transferId;
  final String? aesKey;
  final int? expiresMultiplier;

  const ReceiverSession({
    required this.id,
    required this.status,
    this.transferId,
    this.aesKey,
    this.expiresMultiplier,
  });

  ReceiverSession copyWith({
    String? id,
    ReceiverSessionStatus? status,
    String? transferId,
    String? aesKey,
    int? expiresMultiplier,
  }) {
    return ReceiverSession(
      id: id ?? this.id,
      status: status ?? this.status,
      transferId: transferId ?? this.transferId,
      aesKey: aesKey ?? this.aesKey,
      expiresMultiplier: expiresMultiplier ?? this.expiresMultiplier,
    );
  }

  @override
  List<Object?> get props => [
    id,
    status,
    transferId,
    aesKey,
    expiresMultiplier,
  ];
}
