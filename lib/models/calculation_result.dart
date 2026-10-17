import 'package:fastest_path/models/path_models.dart';
import 'package:fastest_path/models/path_task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calculation_result.g.dart';

class CalculationResult {
  const CalculationResult({
    required this.task,
    required this.grid,
    required this.path,
  });

  final PathTask task;
  final Grid grid;
  final List<Point2D> path;

  bool get isStartValid => grid.isValid(task.start);
  bool get isEndValid => grid.isValid(task.end);
  bool get hasValidEndpoints => isStartValid && isEndValid;
  bool get isPathFound => path.isNotEmpty || task.start == task.end;

  String get arrowsPath => path.map((p) => '(${p.x},${p.y})').join('->');
}

@JsonSerializable()
class SubmissionStep {
  const SubmissionStep({required this.x, required this.y});

  factory SubmissionStep.fromJson(Map<String, dynamic> json) =>
      _$SubmissionStepFromJson(json);

  final String x;
  final String y;

  Map<String, dynamic> toJson() => _$SubmissionStepToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmissionResult {
  const SubmissionResult({required this.steps, required this.path});

  factory SubmissionResult.fromJson(Map<String, dynamic> json) =>
      _$SubmissionResultFromJson(json);

  final List<SubmissionStep> steps;
  final String path;

  Map<String, dynamic> toJson() => _$SubmissionResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmissionEntry {
  const SubmissionEntry({required this.id, required this.result});

  factory SubmissionEntry.fromJson(Map<String, dynamic> json) =>
      _$SubmissionEntryFromJson(json);

  factory SubmissionEntry.fromCalculation(CalculationResult result) =>
      SubmissionEntry(
        id: result.task.id,
        result: SubmissionResult(
          steps: result.path
              .map((p) => SubmissionStep(x: p.x.toString(), y: p.y.toString()))
              .toList(),
          path: result.arrowsPath,
        ),
      );

  final String id;
  final SubmissionResult result;

  Map<String, dynamic> toJson() => _$SubmissionEntryToJson(this);
}
