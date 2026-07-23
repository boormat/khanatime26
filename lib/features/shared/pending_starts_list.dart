import 'package:flutter/material.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/utils/time_formatter.dart';

class PendingStartsList extends StatelessWidget {
  final String eventId;
  final int testNumber;
  final AppDatabase db;
  final ValueChanged<int> onCarSelected;

  const PendingStartsList({
    super.key,
    required this.eventId,
    required this.testNumber,
    required this.db,
    required this.onCarSelected,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StartEvent>>(
      stream: db.timingDao.watchStartsForTest(eventId, testNumber),
      builder: (context, startSnap) {
        final starts = startSnap.data ?? [];
        if (starts.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No starts yet',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        }

        return StreamBuilder<List<FinishEvent>>(
          stream: db.timingDao.watchFinishesForTest(eventId, testNumber),
          builder: (context, finishSnap) {
            final finishes = finishSnap.data ?? [];

            // Build set of finished pairing keys
            final finishedKeys = <_Key>{};
            for (final f in finishes) {
              if (f.carNumber != null && f.runNumber != null) {
                finishedKeys.add(_Key(f.carNumber!, f.runNumber!));
              }
            }

            // Filter to pending (started but not finished)
            final pending = starts.where((s) {
              return !finishedKeys.contains(_Key(s.carNumber, s.runNumber));
            }).toList();

            if (pending.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'All cars finished',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }

            final now = DateTime.now().millisecondsSinceEpoch;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pending.length,
              itemBuilder: (context, index) {
                final start = pending[index];
                final age = now - start.timestamp;
                final ageStr = formatAge(age);
                final statusIcon = _statusIcon(start.status);

                return ListTile(
                  dense: true,
                  leading: statusIcon,
                  title: Text(
                    'Car ${start.carNumber} R${start.runNumber}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('${formatTimestamp(start.timestamp)}  $ageStr'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => onCarSelected(start.carNumber),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _statusIcon(String status) {
    switch (status) {
      case 'clean':
        return const Icon(Icons.check_circle, color: Colors.green);
      case 'jump_start':
        return const Icon(Icons.warning, color: Colors.orange);
      case 'dns':
        return const Icon(Icons.cancel, color: Colors.red);
      default:
        return const Icon(Icons.help_outline, color: Colors.grey);
    }
  }
}

class _Key {
  final int car;
  final int run;
  const _Key(this.car, this.run);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _Key && car == other.car && run == other.run;
  @override
  int get hashCode => Object.hash(car, run);
}
