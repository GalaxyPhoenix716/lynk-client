import 'package:client/core/network/network_providers.dart';
import 'package:client/features/file_transfer/data/datasources/transfer_remote_data_source.dart';
import 'package:client/features/file_transfer/data/datasources/transfer_remote_data_source_impl.dart';
import 'package:client/features/file_transfer/data/repositories/transfer_repository_impl.dart';
import 'package:client/features/file_transfer/domain/repositories/transfer_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transfer_providers.g.dart';

@riverpod
TransferRemoteDataSource transferRemoteDataSource(Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  return TransferRemoteDataSourceImpl(dio: dio);
}

@riverpod
TransferRepository transferRepository(Ref ref) {
  final remoteDataSource = ref.watch(transferRemoteDataSourceProvider);
  return TransferRepositoryImpl(remoteDataSource: remoteDataSource);
}
