import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/recent_transfer_record.dart';
import '../../domain/repositories/recent_transfers_repository.dart';
import '../models/recent_transfer_record_model.dart';

class RecentTransfersRepositoryImpl implements RecentTransfersRepository {
  final SharedPreferences prefs;
  static const String _storageKey = 'recent_transfers_history';
  static const int _maxLimit = 20;

  RecentTransfersRepositoryImpl({required this.prefs});

  @override
  Future<List<RecentTransferRecord>> getRecentTransfers() async {
    final rawList = prefs.getStringList(_storageKey) ?? [];
    final records = <RecentTransferRecord>[];

    for (final itemStr in rawList) {
      try {
        final map = jsonDecode(itemStr) as Map<String, dynamic>;
        records.add(RecentTransferRecordModel.fromJson(map));
      } catch (_) {}
    }

    records.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return records;
  }

  @override
  Future<void> addRecentTransfer(RecentTransferRecord record) async {
    final existing = await getRecentTransfers();
    final model = RecentTransferRecordModel.fromEntity(record);

    existing.removeWhere((r) => r.id == record.id);
    existing.insert(0, model);

    if (existing.length > _maxLimit) {
      existing.removeRange(_maxLimit, existing.length);
    }

    final rawList = existing
        .map(
          (r) => jsonEncode(RecentTransferRecordModel.fromEntity(r).toJson()),
        )
        .toList();

    await prefs.setStringList(_storageKey, rawList);
  }

  @override
  Future<void> clearAllRecentTransfers() async {
    await prefs.remove(_storageKey);
  }
}
