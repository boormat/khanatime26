import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Khanatime26')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your role',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            _RoleButton(
              label: 'Official',
              subtitle: 'Start / Finish / Both',
              icon: Icons.timer,
              onTap: () => context.push('/official/position'),
            ),
            const SizedBox(height: 16),
            _RoleButton(
              label: 'Timekeeper',
              subtitle: 'Event setup, live feed, results',
              icon: Icons.dashboard,
              onTap: () => context.push('/timekeeper/setup'),
            ),
            const SizedBox(height: 16),
            _RoleButton(
              label: 'Competitor',
              subtitle: 'View results',
              icon: Icons.leaderboard,
              onTap: () => context.push('/competitor/results/demo'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleButton({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        onTap: onTap,
      ),
    );
  }
}
