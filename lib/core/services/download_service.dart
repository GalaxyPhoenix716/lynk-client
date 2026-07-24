import 'dart:typed_data';
import 'package:dio/dio.dart';

class DownloadService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<void> downloadFileFromR2({
    required String downloadUrl,
    required String savePath,
    required void Function(int received, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      await _dio.download(
        downloadUrl,
        savePath,
        onReceiveProgress: onProgress,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      final responseBody = e.response?.data?.toString() ?? e.message;
      throw Exception(
        'R2 download error (${e.response?.statusCode}): $responseBody',
      );
    }
  }

  Future<Uint8List> downloadBytesFromR2({
    required String downloadUrl,
    required void Function(int received, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get<List<int>>(
        downloadUrl,
        options: Options(responseType: ResponseType.bytes),
        onReceiveProgress: onProgress,
        cancelToken: cancelToken,
      );
      return Uint8List.fromList(response.data!);
    } on DioException catch (e) {
      final responseBody = e.response?.data?.toString() ?? e.message;
      throw Exception(
        'R2 download error (${e.response?.statusCode}): $responseBody',
      );
    }
  }
}
