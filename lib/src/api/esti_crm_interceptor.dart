import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EstiCrmInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Retrieve actual values from the .env file
    final companyId = dotenv.env['API_COMPANY_ID'];
    final apiToken = dotenv.env['API_TOKEN'];

    // Automatically inject auth credentials into query parameters for every request
    options.queryParameters.addAll({'company': companyId, 'token': apiToken});

    // Mandatory header to tell the server we expect a JSON response and handle it as an AJAX request
    options.headers['X-Requested-With'] = 'XMLHttpRequest';

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('--- API Response [${response.statusCode}] ---');

    // Security check: if the server returns HTML instead of JSON (common on auth failure or 404s)
    if (response.data is String &&
        response.data.toString().contains('<!DOCTYPE html>')) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
              'Received HTML instead of JSON. Check your API token or endpoint.',
          type: DioExceptionType.badResponse,
        ),
      );
    }

    // EstiCRM usually wraps errors inside a 200 OK response with a "status: false" flag
    if (response.data is Map && response.data['status'] == false) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: response.data['message'] ?? 'API returned an error status.',
          type: DioExceptionType.badResponse,
        ),
      );
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('--- API Error ---');
    debugPrint('Path: ${err.requestOptions.path}');
    debugPrint('Status Code: ${err.response?.statusCode}');
    debugPrint('Error: ${err.error}');

    // Handle specific status codes globally
    if (err.response?.statusCode == 401) {
      debugPrint('Unauthorized: Please check your API_TOKEN in .env');
      // Potential spot to trigger a logout event or redirect to login
    } else if (err.response?.statusCode == 404) {
      debugPrint('Resource not found: Check the endpoint path.');
    }

    super.onError(err, handler);
  }
}
