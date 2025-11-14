// lib/core/database/api/api_consumer.dart
import 'package:smart_city/core/database/api/end_ponits.dart';

abstract class ApiConsumer {
  final String baseUrl = EndPoints.baseUrl;

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = false,
  });

  Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool requireAuth = false,
  });

  Future<Map<String, dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool isFormData = false,
    bool requireAuth = false,
  });

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool requireAuth = false,
  });
}
