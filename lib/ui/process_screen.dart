import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fastest_path/application/process_cubit.dart';
import 'package:fastest_path/application/process_state.dart';
import 'package:fastest_path/services/pathfinding_api.dart';
import 'package:fastest_path/ui/result_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ProcessCubit(PathfindingApi(Dio()));
        unawaited(cubit.process(url));
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Process screen')),
        body: BlocConsumer<ProcessCubit, ProcessState>(
          listener: (context, state) {
            if (state.status == ProcessStatus.ready &&
               state.submissionResults.isNotEmpty) {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) =>
                      ResultListScreen(results: state.results),
                ),
              );
            }
          },
          builder: (context, state) {
            return switch (state.status) {
              ProcessStatus.failure => _buildErrorView(context, state),
              _ => _buildProcessView(context, state),
            };
          },
        ),
      ),
    );
  }

  Widget _buildProcessView(BuildContext context, ProcessState state) {
    final isCalculated = state.progress >= 1.0;
    final isSubmitting = state.status == ProcessStatus.submitting;
    final percentage = (state.progress * 100).round();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.errorMessage != null) ...[
                  Text(
                    state.errorMessage!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                ],
                Text(
                  isCalculated
                      ? 'All calculations has finished, '
                            'you can send your results to server'
                      : 'Calculating paths...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '$percentage%',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator.adaptive(
                    value: state.progress,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildSubmitButton(context, isCalculated, isSubmitting),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    bool isCalculated,
    bool isSubmitting,
  ) {
    return ElevatedButton(
      onPressed: (!isCalculated || isSubmitting)
          ? null
          : () => context.read<ProcessCubit>().submit(),
      child: isSubmitting
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
            )
          : const Text('Send results to server'),
    );
  }

  Widget _buildErrorView(BuildContext context, ProcessState state) {
    final isSubmitting = state.status == ProcessStatus.submitting;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    state.errorMessage ?? 'Failed to prcess',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.fontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: isSubmitting
                ? null
                : () => context.read<ProcessCubit>().process(url),
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
