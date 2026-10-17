import 'package:fastest_path/application/process_cubit.dart';
import 'package:fastest_path/application/process_state.dart';
import 'package:fastest_path/models/path_models.dart';
import 'package:fastest_path/models/path_task.dart';
import 'package:fastest_path/services/pathfinding_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPathfindingApi extends Mock implements PathfindingApi;

PathTask _task(String id) => PathTask(
      id: id,
      field: ['..', '..'],
      start: const Point2D(x: 0, y: 0),
      end: const Point2D(x: 1, y: 1),
    );

void main() {
  const url = 'http://example.com/api';
  late MockPathfindingApi mockApi;

  setUp(() {
    mockApi = MockPathfindingApi();
  });

  test('initial state', () {
    final cubit = ProcessCubit(mockApi);
    expect(cubit.state.status, ProcessStatus.loading);
    expect(cubit.state.results, isEmpty);
    expect(cubit.state.progress, 0);
  });

  test('process computes results and reaches ready', () async {
    when(() => mockApi.fetchTasks(url))
        .thenAnswer((_) async => [_task('a'), _task('b')]);
    final cubit = ProcessCubit(mockApi);
    await cubit.process(url);
    expect(cubit.state.status, ProcessStatus.ready);
    expect(cubit.state.url, url);
    expect(cubit.state.results, hasLength(2));
    expect(cubit.state.progress, 1);
    expect(cubit.state.errorMessage, isNull);
  });

  test('process failure sets failure state', () async {
    when(() => mockApi.fetchTasks(url)).thenThrow(Exception('fetch failed'));
    final cubit = ProcessCubit(mockApi);
    await cubit.process(url);
    expect(cubit.state.status, ProcessStatus.failure);
    expect(cubit.state.errorMessage, contains('fetch failed'));
  });

  test('submit success stores submission results', () async {
    when(() => mockApi.fetchTasks(url)).thenAnswer((_) async => [_task('a')]);
    when(() => mockApi.submitResults(url, any())).thenAnswer(
      (_) async => [
        {'id': 'a', 'correct': true},
      ],
    );

    final cubit = ProcessCubit(mockApi);
    await cubit.process(url);
    await cubit.submit();

    expect(cubit.state.status, ProcessStatus.ready);
    expect(cubit.state.submissionResults, hasLength(1));
    expect(cubit.state.submissionResults.first['correct'], true);
  });

  test('submit failure keeps ready with error', () async {
    when(() => mockApi.fetchTasks(url)).thenAnswer((_) async => [_task('a')]);
    when(() => mockApi.submitResults(url, any()))
        .thenThrow(Exception('submit failed'));

    final cubit = ProcessCubit(mockApi);
    await cubit.process(url);
    await cubit.submit();

    expect(cubit.state.status, ProcessStatus.ready);
    expect(cubit.state.errorMessage, contains('submit failed'));
  });
}
