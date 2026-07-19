import 'package:flutter/material.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Event QR')),
      body: const Center(
        child: Text('QR scanning — Sprint 5 (Matrix integration)'),
      ),
    );
  }
}
