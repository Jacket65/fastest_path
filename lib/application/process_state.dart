import 'package:fastest_path/models/calculation_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_state.freezed.dart';

enum ProcessStatus { loading, ready, submitting, failure }

@freezed
abstract class ProcessState with _$ProcessState {
  const factory ProcessState({
    required ProcessStatus status,
    required String url,
    required List<CalculationResult> results,
    required double progress,
    required String? errorMessage,
    required List<Map<String, dynamic>> submissionResults,
  }) = _ProcessState;

  factory ProcessState.initial({String url = ''}) => ProcessState(
    status: ProcessStatus.loading,
    url: url,
    results: const [],
    progress: 0,
    errorMessage: null,
    submissionResults: const [],
  );
}
