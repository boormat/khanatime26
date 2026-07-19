import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PositionSelectScreen extends StatelessWidget {
  const PositionSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Position')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Where are you positioned?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/official/start/demo/1'),
                icon: const Icon(Icons.play_arrow, size: 32),
                label: const Text('Start'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/official/finish/demo/1'),
                icon: const Icon(Icons.stop, size: 32),
                label: const Text('Finish'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => context.push('/official/both/demo/1'),
                icon: const Icon(Icons.timer, size: 32),
                label: const Text('Both'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
