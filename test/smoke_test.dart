// ignore pring in test
// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fastest_path/algorithm/grid_path_finder.dart';
import 'package:fastest_path/models/calculation_result.dart';
import 'package:fastest_path/models/path_models.dart';
import 'package:fastest_path/services/pathfinding_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('check tasks and submit', () async {
    final api = PathfindingApi(Dio());
    const url = 'https://flutter.webspark.dev/flutter/api?foo=bar&x=1';
    final tasks = await api.fetchTasks(url);
    expect(tasks, isNotEmpty);
    print('TASKS: ${tasks.map((e) => e.toString()).toList().join('\n')}');

    final results = <CalculationResult>[];

    final pathFinder = GridPathFinder();
    for (final task in tasks) {
      final grid = Grid.fromRows(task.field);
      final pathResult = pathFinder.findShortestPath(
        grid: grid,
        start: task.start,
        end: task.end,
      );
      final path = pathResult.when(
        success: (p) => p,
        notFound: () => <Point2D>[],
      );
      results.add(CalculationResult(task: task, grid: grid, path: path));
    }
    final payload = results
        .map((r) => SubmissionEntry.fromCalculation(r).toJson())
        .toList();
    print('PAYLOAD: $payload');
    final resp = await api.submitResults(url, payload);
    expect(resp, isNotEmpty);
    expect(resp.length, results.length);
    print('RESP: $resp');
    for (final r in resp) {
      expect(r['correct'], true);
    }
  });
}
