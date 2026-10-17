import 'package:fastest_path/models/path_models.dart';
import 'package:flutter/material.dart';

class PathGrid extends StatelessWidget {
  const PathGrid({
    required this.grid,
    required this.path,
    required this.start,
    required this.end,
    super.key,
  });

  final Grid grid;
  final List<Point2D> path;
  final Point2D start;
  final Point2D end;

  @override
  Widget build(BuildContext context) {
    final itemCount = grid.width * grid.height;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: grid.width,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final x = index % grid.width;
        final y = index ~/ grid.width;

        final point = Point2D(x: x, y: y);
        final isWall = grid.walls.contains(point);

        final color = _getCellColor(point, start, end, path, isWall);
        final textColor = isWall ? Colors.white : Colors.black;

        final showText = grid.width <= 12 && grid.height <= 12;

        return Container(
          decoration: BoxDecoration(border: Border.all(), color: color),
          alignment: Alignment.center,
          child: showText
              ? Text(
                  '$x,$y',
                  style: TextStyle(
                    color: textColor,
                    fontSize: grid.width > 8 ? 8 : 10,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : null,
        );
      },
    );
  }

  Color _getCellColor(
    Point2D point,
    Point2D start,
    Point2D end,
    List<Point2D> path,
    bool isWall,
  ) {
    if (point == start) return const Color(0xFF64FFDA);
    if (point == end) return const Color(0xFF009688);
    if (isWall) return const Color(0xFF000000);
    if (path.contains(point)) return const Color(0xFF4CAF50);
    return const Color(0xFFFFFFFF);
  }
}
