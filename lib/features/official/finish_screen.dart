import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column, isNotNull;
import 'package:khanatime26/main.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/data/models/penalty.dart';
import 'package:khanatime26/features/shared/pending_starts_list.dart';
import 'package:khanatime26/features/shared/finish_penalty_widget.dart';
import 'package:khanatime26/services/timer_service.dart';
import 'package:khanatime26/services/identity_service.dart';
import 'package:khanatime26/utils/time_formatter.dart';
import 'package:khanatime26/utils/run_pairer.dart';

class FinishScreen extends ConsumerStatefulWidget {
  final String eventId;
  final int testNumber;

  const FinishScreen({
    super.key,
    required this.eventId,
    required this.testNumber,
  });

  @override
  ConsumerState<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends ConsumerState<FinishScreen> {
  int? _selectedCarNumber;
  int? _selectedRunNumber;
  int? _finishTimestamp;
  bool _showPenalty = false;
  List<FinishEvent> _lastFinishes = [];

  @override
  Widget build(BuildContext context) {
    final db = ref.read(databaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test ${widget.testNumber} — FINISH'),
      ),
      body: _showPenalty && _selectedCarNumber != null
          ? _buildPenaltyView(db)
          : _buildMainView(db),
    );
  }

  Widget _buildMainView(AppDatabase db) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    'Pending starts',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                PendingStartsList(
                  eventId: widget.eventId,
                  testNumber: widget.testNumber,
                  db: db,
                  onCarSelected: (car) {
                    setState(() {
                      _selectedCarNumber = car;
                      _selectedRunNumber = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        if (_selectedCarNumber != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              'Selected: Car #$_selectedCarNumber R$_selectedRunNumber',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _onFinish,
              icon: const Icon(Icons.stop, size: 28),
              label: const Text('FINISH'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        if (_lastFinishes.isNotEmpty) ...[
          const Divider(),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: _lastFinishes.length,
              itemBuilder: (context, index) {
                final finish = _lastFinishes[index];
                final carStr = finish.carNumber != null
                    ? 'Car ${finish.carNumber}'
                    : 'Orphan';
                return ListTile(
                  dense: true,
                  leading: const Icon(Icons.check, color: Colors.green),
                  title: Text(carStr),
                  subtitle: Text(formatTimestamp(finish.timestamp)),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPenaltyView(AppDatabase db) {
    return FutureBuilder<int?>(
      future: db.timingDao.slowestCleanTime(widget.eventId, widget.testNumber),
      builder: (context, snapshot) {
        final slowest = snapshot.data ?? 60000;

        return FutureBuilder<List<StartEvent>>(
          future: db.timingDao.getStartsForTest(widget.eventId, widget.testNumber),
          builder: (context, startSnap) {
            final starts = startSnap.data ?? [];

            return FutureBuilder<List<Entry>>(
              future: db.entryDao.entriesForEvent(widget.eventId),
              builder: (context, entrySnap) {
                final entries = entrySnap.data ?? [];
                final paired = pairRuns(
                  starts: starts,
                  finishes: _lastFinishes,
                  entries: entries,
                );

                final run = paired.where((r) =>
                    r.carNumber == _selectedCarNumber &&
                    r.runNumber == _selectedRunNumber).firstOrNull;

                if (run == null) {
                  return const Center(child: Text('Run not found'));
                }

                return FinishPenaltyWidget(
                  run: run,
                  slowestCleanMs: slowest,
                  onSubmit: (penalty) async {
                    await _submitFinish(penalty);
                  },
                  onDiscard: () {
                    setState(() {
                      _showPenalty = false;
                      _finishTimestamp = null;
                    });
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Future<void> _onFinish() async {
    final now = captureTimestamp();
    setState(() {
      _finishTimestamp = now;
      _showPenalty = true;
    });
  }

  Future<void> _submitFinish(Penalty penalty) async {
    final db = ref.read(databaseProvider);
    final officialId = await IdentityService().getOfficialId();

    // Extract marker hits from penalty label
    int markerHits = 0;
    final flagMatch = RegExp(r'(\d+)F').firstMatch(penalty.label);
    if (flagMatch != null) {
      markerHits = int.parse(flagMatch.group(1)!);
    }

    await db.timingDao.insertFinishEvent(
      FinishEventsCompanion.insert(
        eventId: widget.eventId,
        testNumber: widget.testNumber,
        carNumber: Value(_selectedCarNumber),
        runNumber: Value(_selectedRunNumber),
        timestamp: _finishTimestamp!,
        officialId: Value(officialId),
        markerHits: Value(markerHits),
        status: Value(penalty.status),
        createdAt: _finishTimestamp!,
      ),
    );

    final finishes = await db.timingDao.getFinishesForTest(
      widget.eventId,
      widget.testNumber,
    );

    setState(() {
      _lastFinishes = finishes.length > 5
          ? finishes.sublist(finishes.length - 5)
          : finishes;
      _showPenalty = false;
      _selectedCarNumber = null;
      _selectedRunNumber = null;
      _finishTimestamp = null;
    });
  }
}
