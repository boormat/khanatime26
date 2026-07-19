import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/onboarding/role_selection_screen.dart';
import '../features/onboarding/qr_scan_screen.dart';
import '../features/official/position_select_screen.dart';
import '../features/official/start_screen.dart';
import '../features/official/finish_screen.dart';
import '../features/official/both_screen.dart';
import '../features/official/test_overview_screen.dart';
import '../features/timekeeper/event_setup_screen.dart';
import '../features/timekeeper/live_feed_screen.dart';
import '../features/timekeeper/test_results_screen.dart';
import '../features/competitor/results_viewer_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/scan',
        builder: (context, state) => const QrScanScreen(),
      ),
      GoRoute(
        path: '/official/position',
        builder: (context, state) => const PositionSelectScreen(),
      ),
      GoRoute(
        path: '/official/start/:eventId/:testNumber',
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
        path: '/official/finish/:eventId/:testNumber',
        builder: (context, state) => const FinishScreen(),
      ),
      GoRoute(
        path: '/official/both/:eventId/:testNumber',
        builder: (context, state) => const BothScreen(),
      ),
      GoRoute(
        path: '/official/test-overview/:eventId/:testNumber',
        builder: (context, state) => const TestOverviewScreen(),
      ),
      GoRoute(
        path: '/timekeeper/setup',
        builder: (context, state) => const EventSetupScreen(),
      ),
      GoRoute(
        path: '/timekeeper/feed/:eventId',
        builder: (context, state) => const LiveFeedScreen(),
      ),
      GoRoute(
        path: '/timekeeper/results/:eventId/:testNumber',
        builder: (context, state) => const TestResultsScreen(),
      ),
      GoRoute(
        path: '/competitor/results/:eventId',
        builder: (context, state) => const ResultsViewerScreen(),
      ),
    ],
  );
});
