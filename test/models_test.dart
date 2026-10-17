import 'dart:convert';

import 'package:fastest_path/models/calculation_result.dart';
import 'package:fastest_path/models/path_models.dart';
import 'package:fastest_path/models/path_task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Point2D', () {
    test('fromJson handles strings and ints', () {
      final p = Point2D.fromJson({'x': '3', 'y': 4});
      expect(p.x, 3);
      expect(p.y, 4);
    });

    test('round trips through json', () {
      const p = Point2D(x: 1, y: 2);
      final decoded = Point2D.fromJson(
        jsonDecode(jsonEncode(p)) as Map<String, dynamic>,
      );
      expect(decoded, equals(p));
    });
  });

  group('Grid', () {
    test('isValid false for out of bounds and walls', () {
      final grid = Grid(
        width: 2,
        height: 2,
        walls: {const Point2D(x: 0, y: 0)},
      );
      expect(grid.isValid(const Point2D(x: 0, y: 0)), isFalse);
      expect(grid.isValid(const Point2D(x: 2, y: 0)), isFalse);
      expect(grid.isValid(const Point2D(x: 1, y: 1)), isTrue);
    });
  });

  group('PathTask', () {
    test('parses and serializes', () {
      final json = {
        'id': 'abc',
        'field': ['..', '..'],
        'start': {'x': '0', 'y': '0'},
        'end': {'x': '1', 'y': '1'},
      };
      final task = PathTask.fromJson(json);
      expect(task.id, 'abc');
      expect(task.field, ['..', '..']);
      expect(task.start, const Point2D(x: 0, y: 0));
      expect(task.end, const Point2D(x: 1, y: 1));
      final back = task.toJson();
      expect(back['id'], 'abc');
    });
  });

  group('CalculationResult validation', () {
    test('hasValidEndpoints and isPathFound reflect grid state', () {
      const task = PathTask(
        id: 't1',
        field: ['.X.', '...'],
        start: Point2D(x: 0, y: 0),
        end: Point2D(x: 1, y: 0),
      );
      final grid = Grid.fromRows(task.field);
      final calc = CalculationResult(task: task, grid: grid, path: []);
      expect(calc.isStartValid, isTrue);
      expect(calc.isEndValid, isFalse);
      expect(calc.hasValidEndpoints, isFalse);
      expect(calc.isPathFound, isFalse);
    });
  });

  group('SubmissionEntry', () {
    test('fromCalculation builds steps and arrows path', () {
      const task = PathTask(
        id: 't1',
        field: ['..', '..'],
        start: Point2D(x: 0, y: 0),
        end: Point2D(x: 1, y: 1),
      );
      final grid = Grid.fromRows(task.field);
      final calc = CalculationResult(
        task: task,
        grid: grid,
        path: [const Point2D(x: 0, y: 0), const Point2D(x: 1, y: 1)],
      );
      final entry = SubmissionEntry.fromCalculation(calc);
      expect(entry.id, 't1');
      expect(entry.result.steps.length, 2);
      expect(entry.result.steps.first.x, '0');
      expect(entry.result.path, '(0,0)->(1,1)');
      final json = entry.toJson();
      expect(json['id'], 't1');
    });
  });
}
