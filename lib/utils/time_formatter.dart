/// Format milliseconds elapsed time as "MM:SS.cc".
String formatElapsed(int ms) {
  if (ms < 0) return '00:00.00';
  final totalCentiseconds = ms ~/ 10;
  final centiseconds = totalCentiseconds % 100;
  final totalSeconds = totalCentiseconds ~/ 100;
  final seconds = totalSeconds % 60;
  final minutes = totalSeconds ~/ 60;
  return '${_pad2(minutes)}:${_pad2(seconds)}.${_pad2(centiseconds)}';
}

/// Format epoch milliseconds as "HH:MM:SS.mmm".
String formatTimestamp(int ms) {
  final dt = DateTime.fromMillisecondsSinceEpoch(ms);
  return '${_pad2(dt.hour)}:${_pad2(dt.minute)}:${_pad2(dt.second)}.${_pad3(dt.millisecond)}';
}

/// Format age as human-readable string.
String formatAge(int elapsedMs) {
  final seconds = elapsedMs ~/ 1000;
  if (seconds < 60) return '${seconds}s ago';
  final minutes = seconds ~/ 60;
  return '${minutes}m ago';
}

String _pad2(int n) => n.toString().padLeft(2, '0');
String _pad3(int n) => n.toString().padLeft(3, '0');
