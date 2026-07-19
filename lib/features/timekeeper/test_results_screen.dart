import 'package:flutter/material.dart';

class TestResultsScreen extends StatelessWidget {
  const TestResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Results')),
      body: const Center(
        child: Text('Test results — Sprint 3'),
      ),
    );
  }
}
