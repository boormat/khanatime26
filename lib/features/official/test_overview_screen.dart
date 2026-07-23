import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khanatime26/main.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/data/models/run_result.dart';
import 'package:khanatime26/utils/run_pairer.dart';
import 'package:khanatime26/utils/penalty_calculator.dart';
import 'package:khanatime26/utils/best_of_x.dart';
import 'package:khanatime26/utils/time_formatter.dart';

class TestOverviewScreen extends ConsumerWidget {
  final String eventId;
  final int testNumber;

  const TestOverviewScreen({
    super.key,
    required this.eventId,
    required this.testNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.read(databaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test $testNumber — Overview'),
      ),
      body: FutureBuilder<int?>(
        future: db.timingDao.slowestCleanTime(eventId, testNumber),
        builder: (context, slowestSnap) {
          final slowest = slowestSnap.data ?? 60000;

          return StreamBuilder<List<StartEvent>>(
            stream: db.timingDao.watchStartsForTest(eventId, testNumber),
            builder: (context, startSnap) {
              final starts = startSnap.data ?? [];

              return StreamBuilder<List<FinishEvent>>(
                stream: db.timingDao.watchFinishesForTest(eventId, testNumber),
                builder: (context, finishSnap) {
                  final finishes = finishSnap.data ?? [];

                  return FutureBuilder<List<Entry>>(
                    future: db.entryDao.entriesForEvent(eventId),
                    builder: (context, entrySnap) {
                      final entries = entrySnap.data ?? [];

                      final paired = pairRuns(
                        starts: starts,
                        finishes: finishes,
                        entries: entries,
                      );

                      if (paired.isEmpty) {
                        return const Center(
                          child: Text(
                            'No runs yet',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }

                      return _buildTable(context, paired, slowest);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTable(
    BuildContext context,
    List<RunResult> runs,
    int slowestCleanMs,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Car')),
            DataColumn(label: Text('Driver')),
            DataColumn(label: Text('Start')),
            DataColumn(label: Text('Finish')),
            DataColumn(label: Text('Net')),
            DataColumn(label: Text('Status')),
          ],
          rows: runs.map((run) {
            final penalty =
                calculatePenalty(run, slowestCleanMs: slowestCleanMs);
            final net = netTime(run, slowestCleanMs: slowestCleanMs);

            String startStr;
            if (run.startStatus == 'dns') {
              startStr = 'DNS';
            } else if (run.startTimestamp != null) {
              startStr = '✓ R${run.runNumber}';
            } else {
              startStr = '—';
            }

            String finishStr;
            if (run.finishTimestamp != null) {
              finishStr = '✓ R${run.runNumber}';
            } else {
              finishStr = '—';
            }

            String netStr;
            if (net != null) {
              netStr = formatElapsed(net);
            } else {
              netStr = '—';
            }

            String statusStr;
            Color statusColor;
            switch (run.status) {
              case RunStatus.done:
                statusStr = '✓ Done';
                statusColor = Colors.green;
                break;
              case RunStatus.inProgress:
                statusStr = '○ In progress';
                statusColor = Colors.orange;
                break;
              case RunStatus.dns:
                statusStr = '✗ DNS';
                statusColor = Colors.red;
                break;
              case RunStatus.dsq:
                statusStr = '✗ DSQ';
                statusColor = Colors.red;
                break;
            }

            if (penalty.penaltyMs > 0 && run.status == RunStatus.done) {
              statusStr += ' ${penalty.label}';
            }

            return DataRow(cells: [
              DataCell(Text(
                '${run.carNumber}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
              DataCell(Text(run.driverName ?? '—')),
              DataCell(Text(startStr)),
              DataCell(Text(finishStr)),
              DataCell(Text(netStr)),
              DataCell(Text(
                statusStr,
                style: TextStyle(color: statusColor),
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
