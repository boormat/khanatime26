import 'package:flutter/material.dart';

class BothScreen extends StatelessWidget {
  const BothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test 1 — BOTH')),
      body: const Center(
        child: Text('Both mode — Sprint 2'),
      ),
    );
  }
}
