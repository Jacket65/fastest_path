// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PathTask _$PathTaskFromJson(Map<String, dynamic> json) => PathTask(
  id: json['id'] as String,
  field: (json['field'] as List<dynamic>).map((e) => e as String).toList(),
  start: Point2D.fromJson(json['start'] as Map<String, dynamic>),
  end: Point2D.fromJson(json['end'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PathTaskToJson(PathTask instance) => <String, dynamic>{
  'id': instance.id,
  'field': instance.field,
  'start': instance.start,
  'end': instance.end,
};
