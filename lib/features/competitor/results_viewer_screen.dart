import 'package:flutter/material.dart';

class ResultsViewerScreen extends StatelessWidget {
  const ResultsViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: const Center(
        child: Text('Competitor results — Sprint 4'),
      ),
    );
  }
}
