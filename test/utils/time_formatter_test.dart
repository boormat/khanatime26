import 'package:flutter_test/flutter_test.dart';
import 'package:khanatime26/utils/time_formatter.dart';

void main() {
  group('formatElapsed', () {
    test('formats zero', () {
      expect(formatElapsed(0), '00:00.00');
    });

    test('formats seconds only', () {
      expect(formatElapsed(5000), '00:05.00');
    });

    test('formats minutes and seconds', () {
      expect(formatElapsed(72340), '01:12.34');
    });

    test('formats with centiseconds', () {
      expect(formatElapsed(1234), '00:01.23');
    });

    test('formats large values', () {
      expect(formatElapsed(3661123), '61:01.12');
    });

    test('formats 10 minutes', () {
      expect(formatElapsed(600000), '10:00.00');
    });

    test('handles negative values', () {
      expect(formatElapsed(-1000), '00:00.00');
    });
  });

  group('formatTimestamp', () {
    test('formats epoch 0 as midnight', () {
      final result = formatTimestamp(0);
      expect(result, contains(':00:00.'));
    });

    test('formats known time', () {
      // 2024-01-01 12:30:45.123 UTC
      final ms = DateTime.utc(2024, 1, 1, 12, 30, 45, 123).millisecondsSinceEpoch;
      final result = formatTimestamp(ms);
      expect(result, '12:30:45.123');
    });
  });

  group('formatAge', () {
    test('formats seconds', () {
      expect(formatAge(5000), '5s ago');
      expect(formatAge(30000), '30s ago');
    });

    test('formats minutes', () {
      expect(formatAge(60000), '1m ago');
      expect(formatAge(120000), '2m ago');
    });

    test('formats zero', () {
      expect(formatAge(0), '0s ago');
    });
  });
}
