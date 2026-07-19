import 'package:flutter/material.dart';

class LiveFeedScreen extends StatelessWidget {
  const LiveFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Feed')),
      body: const Center(
        child: Text('Live feed — Sprint 3'),
      ),
    );
  }
}
