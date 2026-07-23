import 'package:flutter/material.dart';
import 'package:khanatime26/data/database/database.dart';

class CarNumberPad extends StatefulWidget {
  final ValueChanged<int> onNumberSelected;
  final List<Entry>? registeredCars;

  const CarNumberPad({
    super.key,
    required this.onNumberSelected,
    this.registeredCars,
  });

  @override
  State<CarNumberPad> createState() => _CarNumberPadState();
}

class _CarNumberPadState extends State<CarNumberPad> {
  final _controller = TextEditingController();

  void _onDigit(String digit) {
    final current = _controller.text;
    if (current.length < 4) {
      _controller.text = current + digit;
    }
  }

  void _onBackspace() {
    final current = _controller.text;
    if (current.isNotEmpty) {
      _controller.text = current.substring(0, current.length - 1);
    }
  }

  void _onClear() {
    _controller.clear();
  }

  void _submit() {
    final num = int.tryParse(_controller.text);
    if (num != null && num > 0) {
      widget.onNumberSelected(num);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _controller,
            readOnly: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: 'Car #',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildGrid(),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submit,
              child: const Text('SELECT'),
            ),
          ),
        ),
        if (widget.registeredCars != null &&
            widget.registeredCars!.isNotEmpty) ...[
          const Divider(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Registered cars',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: widget.registeredCars!.length,
              itemBuilder: (context, index) {
                final entry = widget.registeredCars![index];
                return ListTile(
                  dense: true,
                  leading: Text(
                    '#${entry.carNumber}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(entry.driverName),
                  subtitle: entry.passenger != null
                      ? Text('with ${entry.passenger}')
                      : null,
                  onTap: () {
                    widget.onNumberSelected(entry.carNumber);
                    _controller.clear();
                  },
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildRow(['1', '2', '3']),
          const SizedBox(height: 8),
          _buildRow(['4', '5', '6']),
          const SizedBox(height: 8),
          _buildRow(['7', '8', '9']),
          const SizedBox(height: 8),
          _buildRow(['⌫', '0', 'CLR']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys) {
    return Row(
      children: keys.map((key) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (key == '⌫') {
                    _onBackspace();
                  } else if (key == 'CLR') {
                    _onClear();
                  } else {
                    _onDigit(key);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  key,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
