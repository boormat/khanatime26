import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column, isNotNull;
import 'package:khanatime26/main.dart';
import 'package:khanatime26/data/database/database.dart';
import 'package:khanatime26/features/shared/car_number_pad.dart';
import 'package:khanatime26/services/timer_service.dart';
import 'package:khanatime26/services/identity_service.dart';
import 'package:khanatime26/utils/time_formatter.dart';

class StartScreen extends ConsumerStatefulWidget {
  final String eventId;
  final int testNumber;

  const StartScreen({
    super.key,
    required this.eventId,
    required this.testNumber,
  });

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  int? _selectedCarNumber;
  int _nextRunNumber = 1;
  List<StartEvent> _lastStarts = [];
  List<Entry> _registeredCars = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
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
        runNumber: _nextRunNumber,
        timestamp: now,
        officialId: Value(officialId),
        status: const Value('clean'),
        createdAt: now,
      ),
    );

    final starts = await db.timingDao.getStartsForTest(
      widget.eventId,
      widget.testNumber,
    );
    setState(() {
      _lastStarts = starts.length > 5 ? starts.sublist(starts.length - 5) : starts;
    });

    _selectedCarNumber = null;
    _nextRunNumber = 1;
  }

  Future<void> _onDns() async {
    if (_selectedCarNumber == null) return;
    final db = ref.read(databaseProvider);
    final officialId = await IdentityService().getOfficialId();
    final now = captureTimestamp();

    await db.timingDao.insertStartEvent(
      StartEventsCompanion.insert(
        eventId: widget.eventId,
        testNumber: widget.testNumber,
        carNumber: _selectedCarNumber!,
        runNumber: _nextRunNumber,
        timestamp: now,
        officialId: Value(officialId),
        status: const Value('dns'),
        createdAt: now,
      ),
    );

    final starts = await db.timingDao.getStartsForTest(
      widget.eventId,
      widget.testNumber,
    );
    setState(() {
      _lastStarts = starts.length > 5 ? starts.sublist(starts.length - 5) : starts;
      _selectedCarNumber = null;
      _nextRunNumber = 1;
    });
  }

  Future<void> _onJumpStart() async {
    if (_selectedCarNumber == null) return;
    final db = ref.read(databaseProvider);
    final officialId = await IdentityService().getOfficialId();
    final now = captureTimestamp();

    await db.timingDao.insertStartEvent(
      StartEventsCompanion.insert(
        eventId: widget.eventId,
        testNumber: widget.testNumber,
        carNumber: _selectedCarNumber!,
        runNumber: _nextRunNumber,
        timestamp: now,
        officialId: Value(officialId),
        status: const Value('jump_start'),
        createdAt: now,
      ),
    );

    final starts = await db.timingDao.getStartsForTest(
      widget.eventId,
      widget.testNumber,
    );
    setState(() {
      _lastStarts = starts.length > 5 ? starts.sublist(starts.length - 5) : starts;
      _selectedCarNumber = null;
      _nextRunNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ${widget.testNumber} — START'),
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
                    padding: const EdgeInsets.all(16),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Car #$_selectedCarNumber',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Run $_nextRunNumber',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _onStart,
                            icon: const Icon(Icons.play_arrow, size: 28),
                            label: const Text('START'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _onDns,
                            child: const Text('DNS'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _onJumpStart,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.orange,
                            ),
                            child: const Text('Jump Start'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (_lastStarts.isNotEmpty) ...[
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Last starts',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: _lastStarts.length,
                      itemBuilder: (context, index) {
                        final start = _lastStarts[index];
                        final statusStr = start.status == 'clean'
                            ? '✓'
                            : start.status == 'jump_start'
                                ? 'JS'
                                : 'DNS';
                        return ListTile(
                          dense: true,
                          leading: Text(
                            statusStr,
                            style: TextStyle(
                              color: start.status == 'clean'
                                  ? Colors.green
                                  : start.status == 'jump_start'
                                      ? Colors.orange
                                      : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            'Car ${start.carNumber} R${start.runNumber}',
                          ),
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
}
