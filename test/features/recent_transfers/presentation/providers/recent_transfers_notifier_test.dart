import 'package:client/features/onboarding/presentation/providers/onboarding_provider.dart';
import 'package:client/features/recent_transfers/data/models/recent_transfer_record_model.dart';
import 'package:client/features/recent_transfers/domain/entities/recent_transfer_record.dart';
import 'package:client/features/recent_transfers/presentation/providers/recent_transfers_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences mockPrefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockPrefs = await SharedPreferences.getInstance();
  });

  final testRecord = RecentTransferRecordModel(
    id: 'tx_100',
    type: RecentTransferType.sent,
    fileNames: ['image.png'],
    totalSize: 2048,
    timestamp: DateTime.now(),
    status: 'completed',
  );

  group('RecentTransfersNotifier', () {
    test('initial state loads records from repository', () async {
      final container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(mockPrefs)],
      );
      addTearDown(container.dispose);

      final state = await container.read(recentTransfersProvider.future);
      expect(state, isEmpty);
    });

    test('addRecord adds record and updates Riverpod state', () async {
      final container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(mockPrefs)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(recentTransfersProvider.notifier);
      await notifier.addRecord(testRecord);

      final state = await container.read(recentTransfersProvider.future);
      expect(state.length, equals(1));
      expect(state.first.id, equals('tx_100'));
    });

    test('clearHistory removes all records and updates state', () async {
      final container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(mockPrefs)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(recentTransfersProvider.notifier);
      await notifier.addRecord(testRecord);
      await notifier.clearHistory();

      final state = await container.read(recentTransfersProvider.future);
      expect(state, isEmpty);
    });
  });
}
