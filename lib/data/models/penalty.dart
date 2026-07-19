/// Penalty types that can apply to a finish event.
enum PenaltyType {
  clean,
  flags, // +5 per marker hit
  nfg, // +5 plus flags
  wrongDirection, // slowest + 5
  missedStop, // slowest + 5
  reversed, // slowest + 5
  dnf, // slowest + 5
  wrongOrder, // slowest + 10
  dsq, // disqualification
}

/// Computed penalty for a run.
class Penalty {
  final int penaltyMs;
  final String status;
  final String label;

  const Penalty({
    required this.penaltyMs,
    required this.status,
    required this.label,
  });
}
