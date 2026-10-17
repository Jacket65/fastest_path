import 'package:dio/dio.dart';
import 'package:fastest_path/services/pathfinding_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  group('PathfindingApi with DioAdapter', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late PathfindingApi api;
    const url = 'http://example.com/api';

    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      api = PathfindingApi(dio);
    });

    test('fetchTasks parses tasks', () async {
      dioAdapter.onGet(
        url,
        (server) => server.reply(200, {
          'error': false,
          'data': [
            {
              'id': 't1',
              'field': ['..', '..'],
              'start': {'x': '0', 'y': '0'},
              'end': {'x': '1', 'y': '1'},
            },
          ],
        }),
      );

      final tasks = await api.fetchTasks(url);
      expect(tasks, hasLength(1));
      expect(tasks.first.id, 't1');
    });

    test('fetchTasks throws when error true via interceptor', () async {
      dioAdapter.onGet(
        url,
        (server) => server.reply(
          200,
          {
            'error': true,
            'message': 'boom',
            'data': <dynamic>[],
          },
        ),
      );

      expect(() => api.fetchTasks(url), throwsException);
    });

    test('fetchTasks throws when data not list', () async {
      dioAdapter.onGet(
        url,
        (server) => server.reply(200, {'error': false, 'data': 'nope'}),
      );

      expect(
        () => api.fetchTasks(url),
        throwsFormatException,
      );
    });

    test('submitResults parses response', () async {
      dioAdapter.onPost(
        url,
        (server) => server.reply(200, {
          'error': false,
          'data': [
            {'id': 't1', 'correct': true},
          ],
        }),
        data: Matchers.any,
      );

      final resp = await api.submitResults(
        url,
        <Map<String, dynamic>>[
          {
            'id': 't1',
            'result': {'steps': <dynamic>[], 'path': ''},
          },
        ],
      );
      expect(resp, hasLength(1));
      expect(resp.first['correct'], true);
    });

    test('submitResults throws when error true via interceptor', () async {
      dioAdapter.onPost(
        url,
        (server) => server.reply(
          200,
          {
            'error': true,
            'message': 'bad',
            'data': <dynamic>[],
          },
        ),
        data: Matchers.any,
      );

      expect(
        () => api.submitResults(url, []),
        throwsException,
      );
    });
  });
}
