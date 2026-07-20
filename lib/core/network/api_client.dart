import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = _getBaseUrl();
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => debugPrint('DioLog: $obj'),
      ),
    );
  }

  static String _getBaseUrl() {
    try {
      if (Platform.isAndroid) {
        return dotenv.env['API_BASE_URL']!;
      }
    } catch (_) {
      // Fallback if Platform is not supported (e.g. web)
    }
    return dotenv.env['API_BASE_URL']!;
  }

  Dio get dio => _dio;
}
