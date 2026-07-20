import 'package:flutter_test/flutter_test.dart';
import 'package:client/features/file_receive/data/models/receiver_session_model.dart';
import 'package:client/features/file_receive/domain/entities/receiver_session.dart';

void main() {
  group('ReceiverSessionModel', () {
    test('fromJson parses waiting session correctly', () {
      final json = {
        'session_id': 'sess_abc',
        'status': 'waiting',
        'transfer_id': null,
        'expires_in': 600,
      };

      final model = ReceiverSessionModel.fromJson(json);

      expect(model.id, 'sess_abc');
      expect(model.status, ReceiverSessionStatus.waiting);
      expect(model.transferId, isNull);
      expect(model.expiresMultiplier, 600);
    });

    test('fromJson parses attached session correctly', () {
      final json = {
        'session_id': 'sess_xyz',
        'status': 'attached',
        'transfer_id': 'tx_777',
        'expires_in': 500,
      };

      final model = ReceiverSessionModel.fromJson(json);

      expect(model.id, 'sess_xyz');
      expect(model.status, ReceiverSessionStatus.attached);
      expect(model.transferId, 'tx_777');
    });
  });
}
