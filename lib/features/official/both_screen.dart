import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column, isNotNull;
import 'package:khanatime26/main.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/data/models/penalty.dart';
import 'package:khanatime26/features/shared/car_number_pad.dart';
import 'package:khanatime26/features/shared/finish_penalty_widget.dart';
import 'package:khanatime26/services/timer_service.dart';
import 'package:khanatime26/services/identity_service.dart';
import 'package:khanatime26/utils/time_formatter.dart';
import 'package:khanatime26/utils/run_pairer.dart';

class BothScreen extends ConsumerStatefulWidget {
  final String eventId;
  final int testNumber;

  const BothScreen({
    super.key,
    required this.eventId,
    required this.testNumber,
  });

  @override
  ConsumerState<BothScreen> createState() => _BothScreenState();
}

class _BothScreenState extends ConsumerState<BothScreen> {
  int? _selectedCarNumber;
  int? _nextRunNumber;
  int? _startTimestamp;
  int _elapsedMs = 0;
  StreamSubscription<int>? _elapsedSub;
  bool _showPenalty = false;
  List<StartEvent> _lastStarts = [];
  List<Entry> _registeredCars = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _elapsedSub?.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    final db = ref.read(databaseProvider);
    final cars = await db.entryDao.entriesForEvent(widget.eventId);
    setState(() {
      _registeredCars = cars;
      _loading = false;
    });
  }

  Future<void> _onCarSelected(int carNumber) async {
    final db = ref.read(databaseProvider);
    final next = await db.timingDao.nextRunNumber(
      widget.eventId,
      widget.testNumber,
      carNumber,
    );
    setState(() {
      _selectedCarNumber = carNumber;
      _nextRunNumber = next;
    });
  }

  Future<void> _onStart() async {
    if (_selectedCarNumber == null) return;
    final db = ref.read(databaseProvider);
    final officialId = await IdentityService().getOfficialId();
    final now = captureTimestamp();

    await db.timingDao.insertStartEvent(
      StartEventsCompanion.insert(
        eventId: widget.eventId,
        testNumber: widget.testNumber,
        carNumber: _selectedCarNumber!,
        runNumber: _nextRunNumber!,
        timestamp: now,
        officialId: Value(officialId),
        status: const Value('clean'),
        createdAt: now,
      ),
    );

    setState(() {
      _startTimestamp = now;
      _elapsedMs = 0;
    });

    _elapsedSub?.cancel();
    _elapsedSub = elapsedStream(now).listen((elapsed) {
      if (mounted) setState(() => _elapsedMs = elapsed);
    });

    final starts = await db.timingDao.getStartsForTest(
      widget.eventId,
      widget.testNumber,
    );
    setState(() {
      _lastStarts = starts.length > 5 ? starts.sublist(starts.length - 5) : starts;
    });
  }

  Future<void> _onFinish() async {
    if (_startTimestamp == null) return;
    _elapsedSub?.cancel();
    setState(() {
      _showPenalty = true;
    });
  }

  Future<void> _submitFinish(Penalty penalty) async {
    final db = ref.read(databaseProvider);
    final officialId = await IdentityService().getOfficialId();
    final now = captureTimestamp();

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
        runNumber: Value(_nextRunNumber),
        timestamp: now,
        officialId: Value(officialId),
        markerHits: Value(markerHits),
        status: Value(penalty.status),
        createdAt: now,
      ),
    );

    setState(() {
      _showPenalty = false;
      _startTimestamp = null;
      _elapsedMs = 0;
      _selectedCarNumber = null;
      _nextRunNumber = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showPenalty && _selectedCarNumber != null) {
      return _buildPenaltyView();
    }
    return _buildMainView();
  }

  Widget _buildMainView() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ${widget.testNumber} — BOTH'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: CarNumberPad(
                    onNumberSelected: _onCarSelected,
                    registeredCars: _registeredCars,
                  ),
                ),
                if (_selectedCarNumber != null) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Car #$_selectedCarNumber  Run ${_nextRunNumber ?? 1}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (_startTimestamp != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Elapsed: ${formatElapsed(_elapsedMs)}',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _startTimestamp == null ? _onStart : null,
                            icon: const Icon(Icons.play_arrow, size: 28),
                            label: const Text('START'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _startTimestamp != null ? _onFinish : null,
                            icon: const Icon(Icons.stop, size: 28),
                            label: const Text('FINISH'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade700,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (_lastStarts.isNotEmpty) ...[
                  const Divider(),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: _lastStarts.length,
                      itemBuilder: (context, index) {
                        final start = _lastStarts[index];
                        return ListTile(
                          dense: true,
                          leading: const Icon(Icons.check, color: Colors.green),
                          title: Text('Car ${start.carNumber} R${start.runNumber}'),
                          subtitle: Text(formatTimestamp(start.timestamp)),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
    );
  }

  Widget _buildPenaltyView() {
    final db = ref.read(databaseProvider);

    return FutureBuilder<int?>(
      future: db.timingDao.slowestCleanTime(widget.eventId, widget.testNumber),
      builder: (context, snapshot) {
        final slowest = snapshot.data ?? 60000;

        return FutureBuilder<List<StartEvent>>(
          future: db.timingDao.getStartsForTest(widget.eventId, widget.testNumber),
          builder: (context, startSnap) {
            final starts = startSnap.data ?? [];

            return FutureBuilder<List<FinishEvent>>(
              future: db.timingDao.getFinishesForTest(widget.eventId, widget.testNumber),
              builder: (context, finishSnap) {
                final finishes = finishSnap.data ?? [];

                return FutureBuilder<List<Entry>>(
                  future: db.entryDao.entriesForEvent(widget.eventId),
                  builder: (context, entrySnap) {
                    final entries = entrySnap.data ?? [];
                    final paired = pairRuns(
                      starts: starts,
                      finishes: finishes,
                      entries: entries,
                    );

                    final run = paired.where((r) =>
                        r.carNumber == _selectedCarNumber &&
                        r.runNumber == _nextRunNumber).firstOrNull;

                    if (run == null) {
                      return const Center(child: Text('Run not found'));
                    }

                    return Scaffold(
                      appBar: AppBar(title: const Text('Finish Penalties')),
                      body: FinishPenaltyWidget(
                        run: run,
                        slowestCleanMs: slowest,
                        onSubmit: _submitFinish,
                        onDiscard: () {
                          setState(() {
                            _showPenalty = false;
                            _startTimestamp = null;
                            _elapsedMs = 0;
                          });
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
