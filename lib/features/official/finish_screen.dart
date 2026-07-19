import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test 1 — FINISH')),
      body: const Center(
        child: Text('Finish timing — Sprint 2'),
      ),
    );
  }
}
