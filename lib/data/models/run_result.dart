/// Status of a single run (paired start + finish).
enum RunStatus { inProgress, done, dns, dsq }

/// A paired start+finish for one car/run in one test.
class RunResult {
  final String eventId;
  final int testNumber;
  final int carNumber;
  final int runNumber;
  final int? startTimestamp;
  final String startStatus;
  final int? finishTimestamp;
  final int markerHits;
  final String finishStatus;
  final String? driverName;
  final String? passenger;

  const RunResult({
    required this.eventId,
    required this.testNumber,
    required this.carNumber,
    required this.runNumber,
    this.startTimestamp,
    this.startStatus = 'pending',
    this.finishTimestamp,
    this.markerHits = 0,
    this.finishStatus = 'pending',
    this.driverName,
    this.passenger,
  });

  int? get elapsedMs {
    if (startTimestamp == null || finishTimestamp == null) return null;
    return finishTimestamp! - startTimestamp!;
  }

  RunStatus get status {
    if (startStatus == 'dns') return RunStatus.dns;
    if (finishStatus == 'dsq') return RunStatus.dsq;
    if (finishTimestamp == null) return RunStatus.inProgress;
    return RunStatus.done;
  }
}
