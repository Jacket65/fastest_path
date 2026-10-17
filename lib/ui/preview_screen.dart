import 'package:fastest_path/models/calculation_result.dart';
import 'package:fastest_path/ui/widgets/path_grid.dart';
import 'package:flutter/material.dart';

class ResultDetailScreen extends StatelessWidget {
  const ResultDetailScreen({required this.result, super.key});

  final CalculationResult result;

  @override
  Widget build(BuildContext context) {
    final aspectRatio = result.grid.width / result.grid.height;
    final isValid = result.hasValidEndpoints && result.isPathFound;

    return Scaffold(
      appBar: AppBar(title: const Text('Preview screen')),
      body: Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Column(
          children: [
            if (!isValid) ...[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red.withValues(alpha: 0.1),
                child: const Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Warning: Start or End point is invalid '
                        '(out of bounds or on wall), '
                        'or no path could be found.',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 5,
                child: AspectRatio(
                  aspectRatio: aspectRatio > 0 ? aspectRatio : 1.0,
                  child: PathGrid(
                    grid: result.grid,
                    path: result.path,
                    start: result.task.start,
                    end: result.task.end,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isValid ? result.arrowsPath : 'No path found',
              style: TextStyle(
                fontSize: 18,
                color: isValid ? Colors.black : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
