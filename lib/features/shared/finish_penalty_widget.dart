import 'package:flutter/material.dart';
import 'package:khanatime26/data/models/penalty.dart';
import 'package:khanatime26/data/models/run_result.dart';
import 'package:khanatime26/utils/penalty_calculator.dart';
import 'package:khanatime26/utils/time_formatter.dart';

class FinishPenaltyWidget extends StatefulWidget {
  final RunResult run;
  final int slowestCleanMs;
  final ValueChanged<Penalty> onSubmit;
  final VoidCallback onDiscard;

  const FinishPenaltyWidget({
    super.key,
    required this.run,
    required this.slowestCleanMs,
    required this.onSubmit,
    required this.onDiscard,
  });

  @override
  State<FinishPenaltyWidget> createState() => _FinishPenaltyWidgetState();
}

class _FinishPenaltyWidgetState extends State<FinishPenaltyWidget> {
  int _flagCount = 0;
  String _selectedStatus = 'clean';

  @override
  Widget build(BuildContext context) {
    final penalty = calculatePenalty(
      RunResult(
        eventId: widget.run.eventId,
        testNumber: widget.run.testNumber,
        carNumber: widget.run.carNumber,
        runNumber: widget.run.runNumber,
        startTimestamp: widget.run.startTimestamp,
        startStatus: widget.run.startStatus,
        finishTimestamp: widget.run.finishTimestamp,
        markerHits: _flagCount,
        finishStatus: _selectedStatus,
        driverName: widget.run.driverName,
      ),
      slowestCleanMs: widget.slowestCleanMs,
    );

    final elapsed = widget.run.elapsedMs ?? 0;
    final net = elapsed + penalty.penaltyMs;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Text(
              'Car #${widget.run.carNumber} R${widget.run.runNumber}'
              '${widget.run.driverName != null ? ' — ${widget.run.driverName}' : ''}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Time info
            if (widget.run.startTimestamp != null)
              Text('Start: ${formatTimestamp(widget.run.startTimestamp!)}'),
            if (widget.run.finishTimestamp != null)
              Text('Finish: ${formatTimestamp(widget.run.finishTimestamp!)}'),
            if (widget.run.elapsedMs != null)
              Text(
                'Elapsed: ${formatElapsed(widget.run.elapsedMs!)}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            const SizedBox(height: 16),

            // Flag counter
            Row(
              children: [
                const Text('Flags: '),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: _flagCount > 0
                      ? () => setState(() => _flagCount--)
                      : null,
                ),
                Text(
                  '$_flagCount',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => _flagCount++),
                ),
                if (_flagCount > 0)
                  Text(
                    '  (+${_flagCount * 5}s)',
                    style: const TextStyle(color: Colors.orange),
                  ),
              ],
            ),
            const SizedBox(height: 12),

            // Penalty toggle buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _penaltyButton('NFG', 'nfg'),
                _penaltyButton('Wrong Dir', 'wrong_direction'),
                _penaltyButton('Missed', 'missed_stop'),
                _penaltyButton('Reversed', 'reversed'),
                _penaltyButton('DNF', 'dnf'),
                _penaltyButton('Wrong Order', 'wrong_order'),
                _penaltyButton('DSQ', 'dsq'),
              ],
            ),
            const SizedBox(height: 16),

            // Net time
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Net: ${formatElapsed(net)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    penalty.label,
                    style: TextStyle(
                      fontSize: 14,
                      color: penalty.penaltyMs > 0 ? Colors.orange : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onDiscard,
                    child: const Text('DISCARD'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => widget.onSubmit(penalty),
                    child: const Text('SUBMIT'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _penaltyButton(String label, String status) {
    final isSelected = _selectedStatus == status;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedStatus = selected ? status : 'clean';
        });
      },
      selectedColor: Colors.orange.shade100,
      checkmarkColor: Colors.orange,
    );
  }
}
