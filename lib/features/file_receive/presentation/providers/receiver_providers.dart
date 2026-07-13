import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/network_providers.dart';
import '../../data/datasources/receiver_remote_data_source.dart';
import '../../data/datasources/receiver_remote_data_source_impl.dart';
import '../../data/repositories/receiver_repository_impl.dart';
import '../../domain/repositories/receiver_repository.dart';

final receiverRemoteDataSourceProvider = Provider<ReceiverRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ReceiverRemoteDataSourceImpl(dio: dio);
});

final receiverRepositoryProvider = Provider<ReceiverRepository>((ref) {
  final remoteDataSource = ref.watch(receiverRemoteDataSourceProvider);
  return ReceiverRepositoryImpl(remoteDataSource: remoteDataSource);
});
