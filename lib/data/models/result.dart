/// Aggregate result for one driver across all tests.
class EventResult {
  final int entryId;
  final int carNumber;
  final String driverName;
  final String? passenger;
  final List<TestResult> testResults;
  final int aggregateMs;
  final String status;

  const EventResult({
    required this.entryId,
    required this.carNumber,
    required this.driverName,
    this.passenger,
    required this.testResults,
    required this.aggregateMs,
    required this.status,
  });
}

/// Result for one driver in one test.
class TestResult {
  final int testNumber;
  final int bestRunMs;
  final int countingRuns;
  final String status;

  const TestResult({
    required this.testNumber,
    required this.bestRunMs,
    required this.countingRuns,
    required this.status,
  });
}
