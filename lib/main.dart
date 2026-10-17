import 'package:fastest_path/core/theme.dart';
import 'package:fastest_path/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fastest path',
      theme: AppTheme.lightTheme(),
      home: const HomeScreen(),
    );
  }
}
