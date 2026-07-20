import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'api_client.dart';

part 'network_providers.g.dart';

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

@riverpod
Dio dio(Ref ref) {
  return ref.watch(apiClientProvider).dio;
}
