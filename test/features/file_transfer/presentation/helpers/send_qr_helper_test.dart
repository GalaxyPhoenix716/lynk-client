import 'package:client/features/file_transfer/data/models/transfer_model.dart';
import 'package:client/features/file_transfer/presentation/helpers/send_qr_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SendQrHelper & TransferModel fixes tests', () {
    test(
      'calculateRemainingSeconds calculates exact countdown from createdAt timestamp',
      () {
        final now = DateTime.now();
        final createdAt = now.subtract(const Duration(minutes: 3, seconds: 15));
        final remaining = SendQrHelper.calculateRemainingSeconds(createdAt);

        expect(remaining, equals(405)); // 600 - 195 = 405s
      },
    );

    test(
      'TransferModel.fromJson correctly falls back to sum of file sizes when total_size is missing/null',
      () {
        final json = {
          'transfer_id': 'tx_test_size',
          'status': 'ready',
          'total_files': 2,
          'total_size': null,
          'files': [
            {
              'file_id': 'f1',
              'file_name': 'doc.pdf',
              'file_size': 1048576,
              'content_type': 'application/pdf',
              'status': 'pending',
            },
            {
              'file_id': 'f2',
              'file_name': 'img.png',
              'file_size': 2097152,
              'content_type': 'image/png',
              'status': 'pending',
            },
          ],
        };

        final model = TransferModel.fromJson(json);

        expect(model.totalSize, equals(3145728)); // 1MB + 2MB = 3MB
      },
    );
  });
}
