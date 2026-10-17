import 'dart:collection';

import 'package:fastest_path/models/path_models.dart';

class GridPathFinder {
  static const List<Point2D> _directions = [
    Point2D(x: 0, y: -1),
    Point2D(x: 0, y: 1),
    Point2D(x: -1, y: 0),
    Point2D(x: 1, y: 0),
    Point2D(x: -1, y: -1),
    Point2D(x: 1, y: -1),
    Point2D(x: -1, y: 1),
    Point2D(x: 1, y: 1),
  ];

  PathResult findShortestPath({
    required Grid grid,
    required Point2D start,
    required Point2D end,
  }) {
    if (!grid.isValid(start) || !grid.isValid(end)) {
      return const PathResult.notFound();
    }
    if (start == end) {
      return PathResult.success(path: [start]);
    }

    final queue = Queue<Point2D>()..add(start);
    final visited = <Point2D>{start};
    final parentMap = <Point2D, Point2D>{};

    var isFound = false;

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();

      if (current == end) {
        isFound = true;
        break;
      }

      for (final dir in _directions) {
        final neighbor = Point2D(x: current.x + dir.x, y: current.y + dir.y);

        if (grid.isValid(neighbor) && !visited.contains(neighbor)) {
          visited.add(neighbor);
          parentMap[neighbor] = current;
          queue.add(neighbor);
        }
      }
    }

    if (!isFound) {
      return const PathResult.notFound();
    }

    final path = <Point2D>[];
    Point2D? currentStep = end;

    while (currentStep != null) {
      path.add(currentStep);
      currentStep = parentMap[currentStep];
    }

    final shortestPath = path.reversed.toList();

    return PathResult.success(path: shortestPath);
  }

  String findShortestPathFormatted({
    required Grid grid,
    required Point2D start,
    required Point2D end,
  }) {
    final result = findShortestPath(grid: grid, start: start, end: end);
    return result.when(
      success: (path) =>
          '[${path.map((p) => '{x:${p.x}, y:${p.y}}').join(', ')}]',
      notFound: () => 'Not found',
    );
  }

  String formatResult(PathResult result) => result.when(
    success: (path) =>
        '[${path.map((p) => '{x:${p.x}, y:${p.y}}').join(', ')}]',
    notFound: () => 'Not found',
  );
}
