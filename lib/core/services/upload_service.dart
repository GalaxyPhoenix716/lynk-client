import 'dart:io';

import 'package:dio/dio.dart';

class UploadService {
  final Dio _dio = Dio();

  Future<void> uploadFileToR2({
    required File file,
    required String uploadUrl,
    required String contentType,
    required void Function(int sent, int total) onProgress,
    CancelToken? cancelToken,
  }) async {
    final length = await file.length();
    await _dio.put(
      uploadUrl,
      data: file.openRead(),
      options: Options(
        headers: {
          Headers.contentLengthHeader: length,
          Headers.contentTypeHeader: contentType,
        },
      ),
      onSendProgress: onProgress,
      cancelToken: cancelToken,
    );
  }
}
