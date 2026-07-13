import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/network_providers.dart';
import '../../data/datasources/transfer_remote_data_source.dart';
import '../../data/datasources/transfer_remote_data_source_impl.dart';
import '../../data/repositories/transfer_repository_impl.dart';
import '../../domain/repositories/transfer_repository.dart';

final transferRemoteDataSourceProvider = Provider<TransferRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return TransferRemoteDataSourceImpl(dio: dio);
});

final transferRepositoryProvider = Provider<TransferRepository>((ref) {
  final remoteDataSource = ref.watch(transferRemoteDataSourceProvider);
  return TransferRepositoryImpl(remoteDataSource: remoteDataSource);
});
