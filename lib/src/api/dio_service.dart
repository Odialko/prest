import 'package:dio/dio.dart';
import 'package:prest/src/api/esti_crm_interceptor.dart';

class DioService {
  final Dio _dio;

  DioService()
    : _dio = Dio(
        BaseOptions(
          // Base URL for the development API server
          baseUrl: 'https://client-api.esticrm.pl/apiClient',
          // Set response timeout for slower network connections
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          // Ensure we always request and send JSON
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      ) {
    // Add custom interceptor to handle Auth-Tokens and Company IDs from .env
    _dio.interceptors.add(EstiCrmInterceptor());

    // Debugging interceptor: shows full request/response details in the console
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestHeader: true,
        requestBody: true,
      ),
    );
  }

  // Getter to access the configured Dio instance from repositories
  Dio get client => _dio;
}
