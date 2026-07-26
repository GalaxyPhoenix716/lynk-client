import 'package:client/features/recent_transfers/data/models/recent_transfer_record_model.dart';
import 'package:client/features/recent_transfers/data/repositories/recent_transfers_repository_impl.dart';
import 'package:client/features/recent_transfers/domain/entities/recent_transfer_record.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late RecentTransfersRepositoryImpl repository;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    repository = RecentTransfersRepositoryImpl(prefs: prefs);
  });

  final testRecord1 = RecentTransferRecordModel(
    id: 'tx_001',
    type: RecentTransferType.sent,
    fileNames: ['photo.jpg'],
    totalSize: 500000,
    timestamp: DateTime.parse('2026-07-27T00:00:00.000Z'),
    status: 'completed',
  );

  final testRecord2 = RecentTransferRecordModel(
    id: 'tx_002',
    type: RecentTransferType.received,
    fileNames: ['doc.pdf'],
    totalSize: 1200000,
    timestamp: DateTime.parse('2026-07-27T00:05:00.000Z'),
    status: 'completed',
  );

  group('RecentTransfersRepositoryImpl', () {
    test('getRecentTransfers returns empty list initially', () async {
      final records = await repository.getRecentTransfers();
      expect(records, isEmpty);
    });

    test(
      'addRecentTransfer saves record and returns list in reverse chronological order',
      () async {
        await repository.addRecentTransfer(testRecord1);
        await repository.addRecentTransfer(testRecord2);

        final records = await repository.getRecentTransfers();
        expect(records.length, equals(2));
        expect(records.first.id, equals('tx_002')); // Newest first
        expect(records.last.id, equals('tx_001'));
      },
    );

    test(
      'addRecentTransfer prunes records exceeding max limit of 20 items',
      () async {
        for (int i = 1; i <= 25; i++) {
          await repository.addRecentTransfer(
            RecentTransferRecordModel(
              id: 'tx_$i',
              type: RecentTransferType.sent,
              fileNames: ['file_$i.png'],
              totalSize: 1000,
              timestamp: DateTime.now().add(Duration(minutes: i)),
              status: 'completed',
            ),
          );
        }

        final records = await repository.getRecentTransfers();
        expect(records.length, equals(20));
        expect(records.first.id, equals('tx_25')); // Newest preserved
      },
    );

    test('clearAllRecentTransfers wipes all stored records', () async {
      await repository.addRecentTransfer(testRecord1);
      await repository.clearAllRecentTransfers();

      final records = await repository.getRecentTransfers();
      expect(records, isEmpty);
    });
  });
}
