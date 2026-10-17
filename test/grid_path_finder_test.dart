// ignore print

import 'package:fastest_path/algorithm/grid_path_finder.dart';
import 'package:fastest_path/models/path_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Grid.fromRows', () {
    test('parses dimensions and walls', () {
      final rows = ['.X.', '.X.', '...'];
      final grid = Grid.fromRows(rows);
      expect(grid.width, 3);
      expect(grid.height, 3);
      expect(grid.walls, contains(const Point2D(x: 1, y: 0)));
      expect(grid.walls, contains(const Point2D(x: 1, y: 1)));
      expect(grid.isValid(const Point2D(x: 0, y: 0)), isTrue);
      expect(grid.isValid(const Point2D(x: 1, y: 0)), isFalse);
    });

    test('throws on empty rows', () {
      expect(() => Grid.fromRows([]), throwsFormatException);
    });

    test('point equality is structural', () {
      expect(const Point2D(x: 1, y: 2), equals(const Point2D(x: 1, y: 2)));
    });
  });

  group('GridPathFinder', () {
    test('start equals end returns single point', () {
      final grid = Grid.fromRows(['...']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 0, y: 0),
            end: const Point2D(x: 0, y: 0),
          )
          .when(
            success: (p) => expect(p, [const Point2D(x: 0, y: 0)]),
            notFound: () => fail('expected success'),
          );
    });

    test('invalid start or end returns notFound', () {
      final grid = Grid.fromRows(['.X.', '...']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 1, y: 0),
            end: const Point2D(x: 2, y: 0),
          )
          .when(success: (p) => fail('expected notFound'), notFound: () {});
    });

    test('finds horizontal path', () {
      final grid = Grid.fromRows(['....']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 0, y: 0),
            end: const Point2D(x: 3, y: 0),
          )
          .when(
            success: (p) {
              expect(p.first, const Point2D(x: 0, y: 0));
              expect(p.last, const Point2D(x: 3, y: 0));
              expect(p.length, 4);
            },
            notFound: () => fail('expected success'),
          );
    });

    test('uses 8 directions for diagonal shortcut', () {
      final grid = Grid.fromRows(['..', '..']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 0, y: 0),
            end: const Point2D(x: 1, y: 1),
          )
          .when(
            success: (p) => expect(p.length, 2),
            notFound: () => fail('expected success'),
          );
    });

    test('invalid endpoint on wall returns notFound', () {
      final grid = Grid.fromRows(['.X.', '...']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 0, y: 0),
            end: const Point2D(x: 1, y: 0),
          )
          .when(success: (p) => fail('expected notFound'), notFound: () {});
    });

    test('navigates around walls', () {
      final grid = Grid.fromRows(['....', '.XX.', '.XX.', '....']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 0, y: 0),
            end: const Point2D(x: 3, y: 3),
          )
          .when(
            success: (p) {
              expect(p.first, const Point2D(x: 0, y: 0));
              expect(p.last, const Point2D(x: 3, y: 3));
              for (final pt in p) {
                expect(grid.isValid(pt), isTrue);
              }
            },
            notFound: () => fail('expected success'),
          );
    });

    test('no path returns notFound', () {
      final grid = Grid.fromRows(['.X.', 'XXX', '.X.']);
      GridPathFinder()
          .findShortestPath(
            grid: grid,
            start: const Point2D(x: 0, y: 0),
            end: const Point2D(x: 2, y: 2),
          )
          .when(success: (p) => fail('expected notFound'), notFound: () {});
    });
  });

  test('returns formatted path as string representation', () {
    final grid = Grid.fromRows(['....', '.XX.', '.XX.', '....']);
    final formatted = GridPathFinder().findShortestPathFormatted(
      grid: grid,
      start: const Point2D(x: 0, y: 0),
      end: const Point2D(x: 3, y: 3),
    );

    expect(formatted, contains('{x:0, y:0}'));
    expect(formatted, contains('{x:3, y:3}'));
    expect(formatted, startsWith('['));
    expect(formatted, endsWith(']'));
  });
}
