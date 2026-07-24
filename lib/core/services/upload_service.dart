import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class UploadService {
  final Dio _r2Dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<void> uploadFileToR2({
    required String name,
    required int size,
    required String contentType,
    required String uploadUrl,
    File? file,
    Uint8List? bytes,
    required void Function(int sent, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    dynamic uploadData;

    if (kIsWeb) {
      if (bytes == null) {
        throw ArgumentError('File bytes must be provided for Web uploads');
      }
      uploadData = bytes;
    } else {
      if (file == null) {
        throw ArgumentError('File object must be provided for Native uploads');
      }
      uploadData = await file.readAsBytes();
    }

    try {
      await _r2Dio.put(
        uploadUrl,
        data: uploadData,
        options: Options(
          contentType: contentType.isNotEmpty ? contentType : 'application/octet-stream',
          headers: {
            Headers.contentLengthHeader: size,
          },
        ),
        onSendProgress: onProgress,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      final responseBody = e.response?.data?.toString() ?? e.message;
      throw Exception('R2 upload failed (${e.response?.statusCode}): $responseBody');
    }
  }
}
