import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../../data/repositories/recent_transfers_repository_impl.dart';
import '../../domain/entities/recent_transfer_record.dart';

part 'recent_transfers_notifier.g.dart';

@riverpod
class RecentTransfersNotifier extends _$RecentTransfersNotifier {
  @override
  Future<List<RecentTransferRecord>> build() async {
    final prefs = ref.watch(sharedPreferencesProvider);
    final repo = RecentTransfersRepositoryImpl(prefs: prefs);
    return repo.getRecentTransfers();
  }

  Future<void> addRecord(RecentTransferRecord record) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final repo = RecentTransfersRepositoryImpl(prefs: prefs);
    await repo.addRecentTransfer(record);
    ref.invalidateSelf();
  }

  Future<void> clearHistory() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final repo = RecentTransfersRepositoryImpl(prefs: prefs);
    await repo.clearAllRecentTransfers();
    ref.invalidateSelf();
  }
}
