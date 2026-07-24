import 'package:flutter_test/flutter_test.dart';
import 'package:client/features/file_transfer/data/models/transfer_model.dart';
import 'package:client/features/file_transfer/domain/entities/transfer.dart';

void main() {
  group('TransferModel', () {
    test('fromJson parses transfer metadata correctly', () {
      final json = {
        'transfer_id': 'tx_999',
        'status': 'ready',
        'total_files': 1,
        'total_size': 1024,
        'expires_in': 1800,
        'files': [
          {
            'file_id': 'fid_1',
            'file_name': 'doc.pdf',
            'file_size': 1024,
            'content_type': 'application/pdf',
            'status': 'uploaded',
          },
        ],
      };

      final model = TransferModel.fromJson(json);

      expect(model.id, 'tx_999');
      expect(model.status, TransferStatus.ready);
      expect(model.totalFiles, 1);
      expect(model.totalSize, 1024);
      expect(model.expiresMultiplier, 1800);
      expect(model.files.length, 1);
      expect(model.files.first.name, 'doc.pdf');
    });

    test('toJson serializes TransferModel correctly', () {
      final json = {
        'transfer_id': 'tx_123',
        'status': 'uploading',
        'total_files': 1,
        'total_size': 500,
        'expires_in': 1800,
        'files': [
          {
            'file_id': 'f1',
            'file_name': 'a.txt',
            'file_size': 500,
            'content_type': 'text/plain',
            'status': 'pending',
          },
        ],
      };

      final model = TransferModel.fromJson(json);
      final serialized = model.toJson();

      expect(serialized['transfer_id'], 'tx_123');
      expect(serialized['status'], 'uploading');
      expect(serialized['total_files'], 1);
      expect(serialized['total_size'], 500);
      expect(serialized['expires_in'], 1800);
    });
  });
}
