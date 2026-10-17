// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionStep _$SubmissionStepFromJson(Map<String, dynamic> json) =>
    SubmissionStep(x: json['x'] as String, y: json['y'] as String);

Map<String, dynamic> _$SubmissionStepToJson(SubmissionStep instance) =>
    <String, dynamic>{'x': instance.x, 'y': instance.y};

SubmissionResult _$SubmissionResultFromJson(Map<String, dynamic> json) =>
    SubmissionResult(
      steps: (json['steps'] as List<dynamic>)
          .map((e) => SubmissionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$SubmissionResultToJson(SubmissionResult instance) =>
    <String, dynamic>{
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      'path': instance.path,
    };

SubmissionEntry _$SubmissionEntryFromJson(Map<String, dynamic> json) =>
    SubmissionEntry(
      id: json['id'] as String,
      result: SubmissionResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmissionEntryToJson(SubmissionEntry instance) =>
    <String, dynamic>{'id': instance.id, 'result': instance.result.toJson()};
