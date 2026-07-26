import '../entities/recent_transfer_record.dart';

abstract class RecentTransfersRepository {
  Future<List<RecentTransferRecord>> getRecentTransfers();
  Future<void> addRecentTransfer(RecentTransferRecord record);
  Future<void> clearAllRecentTransfers();
}
