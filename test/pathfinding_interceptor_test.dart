import 'package:dio/dio.dart';
import 'package:fastest_path/services/pathfinding_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    dio.interceptors.add(PathfindingInterceptor());

    dioAdapter = DioAdapter(dio: dio);
  });

  group('PathfindingInterceptor', () {
    test('passes through successful response (status 200)', () async {
      dioAdapter.onGet(
        'http://example.com/api',
        (server) => server.reply(200, {
          'error': false,
          'data': [1, 2, 3],
        }),
      );

      final response = await dio.get<Map<String, dynamic>>(
        'http://example.com/api',
      );

      expect(response.statusCode, 200);
      expect(response.data, {
        'error': false,
        'data': [1, 2, 3],
      });
    });

    test('intercepts status 429 Too Many Requests', () async {
      dioAdapter.onGet(
        'http://example.com/api',
        (server) => server.reply(429, {'error': true, 'message': 'rate limit'}),
      );

      await expectLater(
        () => dio.get<Map<String, dynamic>>('http://example.com/api'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            429,
          ),
        ),
      );
    });

    test('intercepts HTML error response page', () async {
      dioAdapter.onGet(
        'http://example.com/api',
        (server) => server.reply(
          502,
          '<!DOCTYPE html><html><body>502 Bad Gateway</body></html>',
          headers: {
            Headers.contentTypeHeader: ['text/html; charset=utf-8'],
          },
        ),
      );

      await expectLater(
        () => dio.get<Map<String, dynamic>>('http://example.com/api'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'statusCode',
            502,
          ),
        ),
      );
    });
  });
}
