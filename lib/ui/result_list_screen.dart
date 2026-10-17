import 'package:fastest_path/models/calculation_result.dart';
import 'package:fastest_path/ui/preview_screen.dart';
import 'package:flutter/material.dart';

class ResultListScreen extends StatelessWidget {
  const ResultListScreen({required this.results, super.key});

  final List<CalculationResult> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result list screen')),
      body: ListView.separated(

        separatorBuilder: (context, index) => const Divider(),

        itemCount: results.length,
        itemBuilder: (context, index) {
          final result = results[index];
          final isValid = result.hasValidEndpoints && result.isPathFound;
          return ListTile(
            title: Text(
              isValid ? result.arrowsPath : 'No path found / Invalid endpoints',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isValid ? Colors.black : Colors.red,
              ),
            ),
            subtitle: !isValid
                ? const Text(
                    'Start/End out of bounds, on wall, or unreachable',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.redAccent, fontSize: 12),
                  )
                : null,
            trailing: !isValid
                ? const Icon(Icons.warning, color: Colors.orange)
                : null,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => ResultDetailScreen(result: result),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
