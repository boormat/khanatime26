# Agents Guide

> Khanatime26 — grassroots khanacross timing app (Flutter + drift).

## Commands

```bash
# Code generation (drift + riverpod)
dart run build_runner build --delete-conflicting-outputs

# Run tests
flutter test

# Run app (connected device / emulator)
flutter run

# Lint
flutter analyze
```

## Architecture

```
lib/
├── main.dart                        # ProviderScope + entry
├── app/
│   ├── app.dart                     # MaterialApp.router
│   ├── router.dart                  # GoRouter — onboarding → role → features
│   └── theme.dart                   # Material3 light/dark theme
├── data/
│   ├── database/
│   │   ├── database.dart            # DriftDatabase — 8 tables, 4 DAOs
│   │   ├── tables/                  # events, tests, entries, start_events,
│   │   │                            # finish_events, categories,
│   │   │                            # entry_categories, officials
│   │   └── daos/                    # event_dao, timing_dao, entry_dao,
│   │                                # category_dao
│   └── models/                      # run_result, penalty, result
├── services/                        # matrix, ble, crypto, sync, timer
├── features/
│   ├── onboarding/                  # role selection, QR scan
│   ├── official/                    # start, finish, both, position, overview
│   ├── timekeeper/                  # event setup, live feed, test results
│   ├── competitor/                  # results viewer
│   └── shared/                      # penalty widget, car number pad, etc.
└── utils/                           # penalty_calculator, time_formatter, etc.
```

**Key design:** Start and finish are separate event records. Elapsed time
computed from pairing key `(event_id, test_number, car_number, run_number)`.
Categories are many-to-many with entries (Outright auto-created).
