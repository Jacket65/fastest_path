import 'package:fastest_path/algorithm/grid_path_finder.dart';
import 'package:fastest_path/application/process_state.dart';
import 'package:fastest_path/models/calculation_result.dart';
import 'package:fastest_path/models/path_models.dart';
import 'package:fastest_path/services/pathfinding_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcessCubit extends Cubit<ProcessState> {
  ProcessCubit(this.api) : super(ProcessState.initial());

  final PathfindingApi api;

  Future<void> process(String url) async {
    if (isClosed) return;
    emit(ProcessState.initial(url: url));
    try {
      final tasks = await api.fetchTasks(url);
      if (isClosed) return;
      final results = <CalculationResult>[];
      for (var i = 0; i < tasks.length; i++) {
        if (isClosed) return;
        final task = tasks[i];
        final grid = Grid.fromRows(task.field);
        final pathResult = GridPathFinder().findShortestPath(
          grid: grid,
          start: task.start,
          end: task.end,
        );
        final path = pathResult.when(
          success: (p) => p,
          notFound: () => <Point2D>[],
        );
        results.add(CalculationResult(task: task, grid: grid, path: path));
        if (isClosed) return;
        emit(state.copyWith(progress: (i + 1) / tasks.length));
      }
      if (isClosed) return;
      emit(
        state.copyWith(
          status: ProcessStatus.ready,
          results: results,
          progress: 1,
          errorMessage: null,
        ),
      );
    } on Object catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: ProcessStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> submit() async {
    if (isClosed) return;
    emit(state.copyWith(status: ProcessStatus.submitting, errorMessage: null));
    try {
      final payload = state.results
          .map((r) => SubmissionEntry.fromCalculation(r).toJson())
          .toList();
      final response = await api.submitResults(state.url, payload);
      if (isClosed) return;
      emit(
        state.copyWith(
          status: ProcessStatus.ready,
          submissionResults: response,
        ),
      );
    } on Object catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(status: ProcessStatus.ready, errorMessage: e.toString()),
      );
    }
  }
}
