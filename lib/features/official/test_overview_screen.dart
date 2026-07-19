import 'package:flutter/material.dart';

class TestOverviewScreen extends StatelessWidget {
  const TestOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Overview')),
      body: const Center(
        child: Text('Test overview — Sprint 2'),
      ),
    );
  }
}
