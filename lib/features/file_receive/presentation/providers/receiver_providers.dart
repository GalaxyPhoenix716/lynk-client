import 'package:client/core/network/network_providers.dart';
import 'package:client/features/file_receive/data/datasources/receiver_remote_data_source.dart';
import 'package:client/features/file_receive/data/datasources/receiver_remote_data_source_impl.dart';
import 'package:client/features/file_receive/data/repositories/receiver_repository_impl.dart';
import 'package:client/features/file_receive/domain/repositories/receiver_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'receiver_providers.g.dart';

@riverpod
ReceiverRemoteDataSource receiverRemoteDataSource(Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  return ReceiverRemoteDataSourceImpl(dio: dio);
}

@riverpod
ReceiverRepository receiverRepository(Ref ref) {
  final remoteDataSource = ref.watch(receiverRemoteDataSourceProvider);
  return ReceiverRepositoryImpl(remoteDataSource: remoteDataSource);
}