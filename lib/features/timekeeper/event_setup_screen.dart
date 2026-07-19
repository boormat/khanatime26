import 'package:flutter/material.dart';

class EventSetupScreen extends StatelessWidget {
  const EventSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Setup')),
      body: const Center(
        child: Text('Event setup — Sprint 3'),
      ),
    );
  }
}
