import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_models.freezed.dart';
part 'path_models.g.dart';

int _toInt(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.parse(value);
  if (value is num) return value.toInt();
  throw FormatException('Expected int, got $value');
}

@freezed
abstract class Point2D with _$Point2D {
  const factory Point2D({
    @JsonKey(fromJson: _toInt) required int x,
    @JsonKey(fromJson: _toInt) required int y,
  }) = _Point2D;

  factory Point2D.fromJson(Map<String, dynamic> json) =>
      _$Point2DFromJson(json);
}

@freezed
abstract class Grid with _$Grid {
  const factory Grid({
    required int width,
    required int height,

    @Default(<Point2D>{}) Set<Point2D> walls,
  }) = _Grid;

  factory Grid.fromRows(List<String> rows, {String wall = 'X'}) {
    if (rows.isEmpty) {
      throw const FormatException('Grid rows must not be empty');
    }
    final height = rows.length;
    final width = rows.first.length;
    final walls = <Point2D>{};
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        if (rows[y][x] == wall) {
          walls.add(Point2D(x: x, y: y));
        }
      }
    }
    return Grid(width: width, height: height, walls: walls);
  }

  const Grid._();
  bool isValid(Point2D point) {
    final isWithinBounds =
        point.x >= 0 && point.x < width && point.y >= 0 && point.y < height;
    final isWall = walls.contains(point);
    return isWithinBounds && !isWall;
  }
}

@freezed
class PathResult with _$PathResult {
  const factory PathResult.success({required List<Point2D> path}) =
      _PathResultSuccess;

  const factory PathResult.notFound() = _PathResultNotFound;
}
