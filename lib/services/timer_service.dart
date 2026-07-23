/// Capture current timestamp in milliseconds since epoch.
///
/// Call this on button tap, not during build, to ensure accurate timing.
int captureTimestamp() => DateTime.now().millisecondsSinceEpoch;

/// Stream that emits elapsed milliseconds every 100ms from [startMs].
///
/// Used by Both mode to display a running clock after start.
Stream<int> elapsedStream(int startMs) {
  return Stream<int>.periodic(
    const Duration(milliseconds: 100),
    (_) => DateTime.now().millisecondsSinceEpoch - startMs,
  );
}
