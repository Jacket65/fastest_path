import 'package:fastest_path/models/path_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'path_task.g.dart';

@JsonSerializable()
class PathTask {
  const PathTask({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  factory PathTask.fromJson(Map<String, dynamic> json) =>
      _$PathTaskFromJson(json);

  Map<String, dynamic> toJson() => _$PathTaskToJson(this);

  final String id;
  final List<String> field;
  final Point2D start;
  final Point2D end;
}
