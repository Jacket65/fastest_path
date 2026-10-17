import 'dart:convert';

import 'package:dio/dio.dart';

class PathfindingInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final statusCode = response.statusCode;
    if (statusCode == 429) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error:
              'Too Many Requests (429): Please slow down and try again later.',
        ),
      );
      return;
    }
    if (statusCode == 500) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error:
              'Internal Server Error (500): '
              'The server encountered an issue. Please try again later.',
        ),
      );
      return;
    }

    dynamic data = response.data;
    if (data is String) {
      final trimmed = data.trim();
      if (trimmed.startsWith('<') ||
          trimmed.toLowerCase().contains('<!doctype html')) {
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error:
                'Server returned an HTML maintenance '
                'or error page instead of JSON.',
          ),
        );
        return;
      }
      try {
        data = jsonDecode(trimmed);
      } on Object catch (_) {
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error: 'Failed to parse response body as JSON.',
          ),
        );
        return;
      }
    }

    if (data is Map) {
      if (data['error'] == true) {
        final serverMessage =
            data['message'] ?? 'An unknown server error occurred.';
        handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
            error: serverMessage,
          ),
        );
        return;
      }
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    String friendlyMessage;

    if (status == 429) {
      friendlyMessage =
          'Too Many Requests (429): You are sending requests too '
          'quickly. Please wait a moment and try again.';
    } else if (status == 500) {
      friendlyMessage =
          'Internal Server Error (500): The server failed to '
          'process the request. Please try again later.';
    } else if (status == 404) {
      friendlyMessage =
          'Not Found (404): The requested API endpoint could not be found.';
    } else if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      friendlyMessage =
          'Connection error: Unable to reach the server. Please '
          'check your network connection.';
    } else if (err.error != null) {
      friendlyMessage = err.error.toString();
    } else {
      friendlyMessage = err.message ?? 'An unexpected network error occurred.';
    }

    final modifiedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: friendlyMessage,
    );

    handler.next(modifiedError);
  }
}
