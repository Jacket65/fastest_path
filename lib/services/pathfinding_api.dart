import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fastest_path/models/path_task.dart';
import 'package:fastest_path/services/pathfinding_interceptor.dart';

class PathfindingApi {
  PathfindingApi(this.dio) {
    if (!dio.interceptors.any((i) => i is PathfindingInterceptor)) {
      dio.interceptors.add(PathfindingInterceptor());
    }
  }

  final Dio dio;

  Map<String, dynamic> _decode(dynamic body) {
    dynamic data = body;
    if (data is String) {
      final trimmed = data.trim();
      try {
        data = jsonDecode(trimmed);
      } on Object catch (_) {
        throw FormatException('Failed to parse response as JSON: $body');
      }
    }
    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }
    throw FormatException('Unexpected response body type: ${data.runtimeType}');
  }

  Future<List<PathTask>> fetchTasks(String url) async {
    try {
      final response = await dio.get<dynamic>(url);
      final data = _decode(response.data);
      final list = data['data'];
      if (list is! List) {
        throw FormatException('Expected task list under "data", got $list');
      }
      return list.map((e) {
        if (e is! Map) {
          throw FormatException('Expected task object map, got $e');
        }
        return PathTask.fromJson(Map<String, dynamic>.from(e));
      }).toList();
    } on DioException catch (e) {
      throw Exception(
        e.error?.toString() ?? e.message ?? 'Failed to fetch tasks',
      );
    }
  }

  Future<List<Map<String, dynamic>>> submitResults(
    String url,
    List<Map<String, dynamic>> results,
  ) async {
    try {
      final response = await dio.post<dynamic>(url, data: results);
      final data = _decode(response.data);
      final list = data['data'];
      if (list is! List) {
        throw FormatException('Expected result list under "data", got $list');
      }
      return list.map((e) {
        if (e is! Map) {
          throw FormatException('Expected result object map, got $e');
        }
        return Map<String, dynamic>.from(e);
      }).toList();
    } on DioException catch (e) {
      throw Exception(
        e.error?.toString() ?? e.message ?? 'Failed to submit results',
      );
    }
  }
}
