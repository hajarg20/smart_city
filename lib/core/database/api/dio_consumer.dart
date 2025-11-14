// lib/core/database/api/dio_consumer.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_city/core/database/api/api_consumer.dart';
import 'package:smart_city/core/database/api/end_ponits.dart';
import 'package:smart_city/core/errors/error_model.dart';
import 'package:smart_city/core/errors/expentions.dart';
import 'package:smart_city/core/utils/app_strings.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  final SharedPreferences prefs;

  DioConsumer({required this.dio, required this.prefs}) {
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra['requireAuth'] != false) {
            final token = prefs.getString(AppStrings.token);
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          handler.next(options);
        },
      ),
    );
  }

  // ────────────────────── HELPER: Convert to Map ──────────────────────
  Map<String, dynamic> _toMap(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is String) {
      try {
        return Map<String, dynamic>.from(jsonDecode(data));
      } catch (_) {
        return {'message': data};
      }
    }
    return {'data': data};
  }

  // ────────────────────── HANDLE DIO EXCEPTION ──────────────────────
  Never handleDioException(DioException e) {
    final data = e.response?.data;
    final map = _toMap(data);

    // إذا كان statusCode >= 400
    if (e.response?.statusCode != null && e.response!.statusCode! >= 400) {
      throw ServerException(ErrorModel.fromJson(map));
    }

    // إذا كان 200 لكن status: error
    if (map['status']?.toString().toLowerCase() == 'error') {
      throw ServerException(ErrorModel.fromJson(map));
    }

    // Connection reset by peer
    if (e.type == DioExceptionType.connectionError ||
        e.message?.contains('reset by peer') == true ||
        e.message?.contains('SocketException') == true) {
      throw ServerException(
        ErrorModel(
          errorMessage:
              'فشل الاتصال بالخادم. تحقق من الإنترنت أو عنوان الخادم.',
        ),
      );
    }

    throw ServerException(
      ErrorModel(errorMessage: e.message ?? 'حدث خطأ غير متوقع'),
    );
  }

  // ────────────────────── POST ──────────────────────
  @override
  Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool requireAuth = true,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth},
          headers: headers,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
      return _toMap(response.data);
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  // ────────────────────── GET ──────────────────────
  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth},
          headers: headers,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
      return _toMap(response.data);
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  // ────────────────────── PUT ──────────────────────
  @override
  Future<Map<String, dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool requireAuth = true,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth},
          headers: headers,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
      return _toMap(response.data);
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  // ────────────────────── DELETE ──────────────────────
  @override
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = true,
  }) async {
    try {
      final response = await dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(
          extra: {'requireAuth': requireAuth},
          headers: headers,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
      return _toMap(response.data);
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
