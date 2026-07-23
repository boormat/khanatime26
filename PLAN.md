# Khanacross App — Build Plan

> Flutter app for khanacross timing. Single app with role selection.
> Officials, timekeeper, and competitor results in v1. Safety views later.
>
> **Timing model:** Start and finish are separate event records. Elapsed time
> is computed when both exist. Categories replace classes (0+ per driver).

---

## Tech Stack

| Layer | Choice | Version |
|---|---|---|
| Framework | Flutter | 3.x (latest stable) |
| Language | Dart | 3.10+ |
| State management | Riverpod (annotations + codegen) | 3.3.2 |
| Local database | drift (SQLite) | 2.34.2 |
| BLE | flutter_blue_plus | 1.31.0+ |
| QR scanning | mobile_scanner | 7.3.0 |
| Secure storage | flutter_secure_storage | 10.3.1 |
| Matrix SDK | matrix (famedly) | 8.1.0 |
| Notifications | flutter_local_notifications | 22.0.1 |
| Crypto | ed25519_hd_key + crypto (Dart stdlib) | — |

---

## Project Structure

```
khanatime26/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   ├── router.dart
│   │   └── theme.dart
│   │
│   ├── data/
│   │   ├── database/
│   │   │   ├── database.dart
│   │   │   ├── tables/
│   │   │   │   ├── events.dart
│   │   │   │   ├── tests.dart
│   │   │   │   ├── entries.dart
│   │   │   │   ├── start_events.dart
│   │   │   │   ├── finish_events.dart
│   │   │   │   ├── categories.dart
│   │   │   │   ├── entry_categories.dart
│   │   │   │   └── officials.dart
│   │   │   └── daos/
│   │   │       ├── event_dao.dart
│   │   │       ├── timing_dao.dart      # start + finish + pairing
│   │   │       ├── entry_dao.dart
│   │   │       └── category_dao.dart
│   │   │
│   │   └── models/
│   │       ├── run_result.dart         # paired start+finish + penalties
│   │       ├── penalty.dart
│   │       └── result.dart
│   │
│   ├── services/
│   │   ├── matrix_service.dart
│   │   ├── ble_sync_service.dart
│   │   ├── crypto_service.dart
│   │   ├── sync_service.dart
│   │   └── timer_service.dart
│   │
│   ├── features/
│   │   ├── onboarding/
│   │   │   ├── role_selection_screen.dart
│   │   │   ├── qr_scan_screen.dart
│   │   │   └── event_join_screen.dart
│   │   │
│   │   ├── official/
│   │   │   ├── position_select_screen.dart  # Start / Finish / Both
│   │   │   ├── test_overview_screen.dart
│   │   │   ├── start_screen.dart
│   │   │   ├── finish_screen.dart
│   │   │   ├── both_screen.dart
│   │   │   └── entry_management_screen.dart
│   │   │
│   │   ├── timekeeper/
│   │   │   ├── event_setup_screen.dart
│   │   │   ├── live_feed_screen.dart
│   │   │   ├── test_results_screen.dart
│   │   │   ├── results_publish_screen.dart
│   │   │   └── key_management_screen.dart
│   │   │
│   │   ├── competitor/
│   │   │   └── results_viewer_screen.dart
│   │   │
│   │   └── shared/
│   │       ├── finish_penalty_widget.dart   # flags + NFG + WD etc.
│   │       ├── car_number_pad.dart
│   │       ├── pending_starts_list.dart
│   │       └── sync_status_indicator.dart
│   │
│   └── utils/
│       ├── penalty_calculator.dart
│       ├── time_formatter.dart
│       ├── best_of_x.dart
│       └── run_pairer.dart               # pair start+finish events
│
├── test/
│   ├── data/
│   │   └── database_test.dart
│   ├── utils/
│   │   ├── penalty_calculator_test.dart
│   │   ├── best_of_x_test.dart
│   │   └── run_pairer_test.dart
│   └── features/
│       └── official/
│           └── timing_test.dart
│
├── pubspec.yaml
└── README.md
```

---

## Data Model (drift Tables)

### events

```sql
CREATE TABLE events (
  id              TEXT PRIMARY KEY,
  name            TEXT NOT NULL,
  date            INTEGER NOT NULL,
  organiser       TEXT,
  best_x          INTEGER NOT NULL DEFAULT 1,
  best_y          INTEGER NOT NULL DEFAULT 1,
  scheduled_tests INTEGER NOT NULL,
  status          TEXT NOT NULL DEFAULT 'setup',
  created_at      INTEGER NOT NULL
);
```

### tests

```sql
CREATE TABLE tests (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id      TEXT NOT NULL REFERENCES events(id),
  test_number   INTEGER NOT NULL,
  name          TEXT,
  start_type    TEXT NOT NULL DEFAULT 'same_garage',
  status        TEXT NOT NULL DEFAULT 'pending',
  UNIQUE(event_id, test_number)
);
```

### entries

No class field. Categories are many-to-many via `entry_categories`.

```sql
CREATE TABLE entries (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id      TEXT NOT NULL REFERENCES events(id),
  car_number    INTEGER NOT NULL,
  driver_name   TEXT NOT NULL,
  licence       TEXT,
  passenger     TEXT,
  status        TEXT NOT NULL DEFAULT 'active',
  join_at_test  INTEGER,
  scratch_test  INTEGER,
  registered_at INTEGER NOT NULL,
  UNIQUE(event_id, car_number)
);
```

### start_events

One record per start observation. Run number is assigned by the start
official (auto-incremented per car per test).

```sql
CREATE TABLE start_events (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id        TEXT NOT NULL,
  test_number     INTEGER NOT NULL,
  car_number      INTEGER NOT NULL,
  run_number      INTEGER NOT NULL,
  official_id     TEXT,
  timestamp       INTEGER NOT NULL,
  status          TEXT NOT NULL DEFAULT 'pending',
  -- pending | clean | DNS | jump_start
  signature       TEXT,
  created_at      INTEGER NOT NULL,
  synced_at       INTEGER
);
-- Pairing key: (event_id, test_number, car_number, run_number)
-- Multiple officials may submit start_events for same key (averaging)
```

### finish_events

One record per finish observation. Matched to start by pairing key.

```sql
CREATE TABLE finish_events (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id        TEXT NOT NULL,
  test_number     INTEGER NOT NULL,
  car_number      INTEGER NOT NULL,
  run_number      INTEGER NOT NULL,
  official_id     TEXT,
  timestamp       INTEGER NOT NULL,
  marker_hits     INTEGER NOT NULL DEFAULT 0,
  -- +5s per flag hit (Rule 12.1)
  status          TEXT NOT NULL DEFAULT 'pending',
  -- pending | clean | DNF | NFG | wrong_direction | missed_stop
  -- | reversed | wrong_order | DSQ
  signature       TEXT,
  created_at      INTEGER NOT NULL,
  synced_at       INTEGER
);
```

### categories

```sql
CREATE TABLE categories (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id    TEXT NOT NULL,
  name        TEXT NOT NULL,
  sort_order  INTEGER NOT NULL DEFAULT 0,
  is_outright INTEGER NOT NULL DEFAULT 0,
  UNIQUE(event_id, name)
);
```

- **Outright** is auto-created when the event is created (`is_outright = 1`).
- Cannot be deleted.
- Timekeeper adds Junior, Female, Buggy, etc.

### entry_categories

```sql
CREATE TABLE entry_categories (
  entry_id    INTEGER NOT NULL REFERENCES entries(id),
  category_id INTEGER NOT NULL REFERENCES categories(id),
  PRIMARY KEY (entry_id, category_id)
);
```

- Driver can be in **zero or more** categories.
- Default: added to Outright on entry create (timekeeper can remove if ineligible).
- Drivers with no categories are still timed; they appear only in Overall.

### officials

```sql
CREATE TABLE officials (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  did           TEXT NOT NULL UNIQUE,
  name          TEXT,
  role          TEXT NOT NULL DEFAULT 'official',
  public_key    TEXT NOT NULL,
  is_authorized INTEGER NOT NULL DEFAULT 1,
  created_at    INTEGER NOT NULL
);
```

### Computed: run_result (not a table)

Paired in code via `run_pairer`:

```
key = (event_id, test_number, car_number, run_number)
start  = start_events for key  (avg timestamps if multiple)
finish = finish_events for key (avg timestamps if multiple)
elapsed_ms = finish.timestamp - start.timestamp  // null if no finish
penalties  = start status + finish status + marker_hits
net_ms     = elapsed_ms + penalty_ms
```

---

## Penalty Ownership

| Location | Records | Penalties |
|---|---|---|
| **Start** | Start timestamp, run number | DNS (no start), jump start (**+5s flat**) |
| **Finish** | Finish timestamp, marker_hits | Flags (**+5s each**), NFG (**+5s + flags**), wrong direction, missed stop, reversed, DNF, wrong order, DSQ |

### Finish penalty detail

| Status / field | Effect |
|---|---|
| `marker_hits` | +5.00s × count (flags) |
| `NFG` | +5.00s **plus** marker hits (Rule 12.1) |
| wrong_direction, missed_stop, reversed, DNF | Slowest clean + 5s (capped at 2× fastest) |
| wrong_order | Slowest clean + 10s (capped) |
| DSQ | Disqualification |

NFG = Not Finished Garage: stop at finish with any part of the car outside the garage.

---

## Key Business Logic

### Elapsed time

```
elapsed(start, finish):
  if finish is null: return null
  return finish.timestamp - start.timestamp
```

### Penalty calculator

```
penaltyForRun(start, finish, testResults):
  penalty_ms = 0

  if start.status == DNS:
    return SLOWEST_PLUS_10(testResults), status DNS

  if start.status == jump_start:
    penalty_ms += 5000

  if finish is null:
    return null, status in_progress

  penalty_ms += finish.marker_hits * 5000

  switch finish.status:
    clean: pass
    NFG:
      penalty_ms += 5000   // already includes marker_hits above
    wrong_direction | missed_stop | reversed | DNF:
      penalty_ms += min(SLOWEST_CLEAN+5000, FASTEST_CLEAN*2)
    wrong_order:
      penalty_ms += min(SLOWEST_CLEAN+10000, FASTEST_CLEAN*2)
    DSQ:
      return DSQ

  return penalty_ms, status
```

Note: For NFG, regs say "+5 plus any marker hit". Implementation: base +5 for NFG status, plus marker_hits × 5 (marker_hits already added above). Do not double-count markers.

### Multi-stopwatch averaging

```
avg_start  = mean(all start timestamps for key)
avg_finish = mean(all finish timestamps for key)
elapsed    = avg_finish - avg_start
```

Timekeeper can discard outlier start or finish events independently.

### Best X of Y

Unchanged — operates on completed run_results (paired start+finish with net_ms).

### Aggregate

Sum of counting run net times across tests. DNS for missing tests uses slowest + 10. Results ranked overall and **per category**.

---

## Screens

### Onboarding

```
[QR Scan] → [Event Loaded] → [Role Selection]
                                  │
              ┌───────────────────┼───────────────────┐
              │                   │                   │
        [Official]          [Timekeeper]        [Competitor]
              │                   │                   │
        [Position]          [Event Setup]       [Results]
     Start/Finish/Both            │
              │             [Live Feed]
        [Test + Timing]
```

### Official — Start mode

```
┌─────────────────────────────────────────┐
│  Test 3 — START        Official: Mat   │
│                                         │
│            Car #17  Williams            │
│            Run: 1   (auto-increment)    │
│                                         │
│       ┌──────────────────────┐          │
│       │     ▶ START          │          │
│       └──────────────────────┘          │
│       [DNS]  [Jump Start]               │
│                                         │
│  Recent starts:                         │
│  Car 23 R1  2s ago ✓                   │
└─────────────────────────────────────────┘
```

- Run number auto-increments per car per test after each successful start
- DNS: no timestamp, status DNS
- Jump start: timestamp recorded, status jump_start (+5s)

### Official — Finish mode

```
┌─────────────────────────────────────────┐
│  Test 3 — FINISH      Official: Sarah │
│                                         │
│  ── Waiting for finish ─────────────── │
│  Car 17 R1  Start 11:05:23  12s ago    │
│  Car 7  R1  Start 11:05:45   8s ago    │
│  Car 45 R1  Start 11:06:01   2s ago    │
│                                         │
│  Selected: Car 17                       │
│  [type car #] [pick from list]          │
│                                         │
│       ┌──────────────────────┐          │
│       │     ⏹ FINISH         │          │
│       └──────────────────────┘          │
│  (always enabled — car optional)        │
│                                         │
│  Last: Car 23 — 01:12.34 ✓             │
└─────────────────────────────────────────┘
```

- Tap pending car to select, or type car number / pick from entrant list
- **⏹ FINISH always works** even with no car selected (timestamp saved; assign car later via timekeeper)
- After finish → post-finish summary:

```
┌─────────────────────────────────────────┐
│  Car #17 — Run 1 — Williams            │
│                                         │
│  Start:   11:05:23.456  (Mat)          │
│  Finish:  11:06:35.796  (Sarah)        │
│  Elapsed: 01:12.34                     │
│                                         │
│  Start: Clean ✓                        │
│  Flags:  [−]  0  [+]     (+5s each)    │
│  [NFG] [Wrong Dir] [Missed Stop]       │
│  [Reversed] [DNF] [Wrong Order] [DSQ]  │
│                                         │
│  Net: 01:12.34                         │
│  [✓ SUBMIT]  [Discard]                 │
└─────────────────────────────────────────┘
```

### Official — Both mode (same spot)

One phone, two buttons. Still creates **two** records (start_event + finish_event). Same official_id on both.

### Timekeeper — Live feed

Separate sections: Starts | Finishes | In progress | Officials.

### Timekeeper — Event setup

Categories list with Outright locked; add Junior/Female/Buggy; assign drivers to categories on entry edit.

### Competitor — Results

Tabs: **Overall** | **Junior** | **Female** | **Buggy** …
Overall = all timed drivers. Category tabs = members of that category only.

---

## Build Sprints

### Sprint 1 — Foundation (Week 1–2)

- [ ] Flutter project setup
- [ ] pubspec.yaml dependencies
- [ ] drift: 8 tables (events, tests, entries, start_events, finish_events, categories, entry_categories, officials)
- [ ] DAOs + Outright auto-create on event insert
- [ ] GoRouter: onboarding → role → features
- [ ] Theme basics
- [ ] Database unit tests

### Sprint 2 — Stopwatch Official (Week 3–4)

- [ ] Timer service
- [ ] Position select: Start / Finish / Both
- [ ] Start screen: START, DNS, jump start, auto run number
- [ ] Finish screen: pending starts feed, car select (tap/type/list), FINISH always enabled
- [ ] Post-finish summary + flag counter + NFG and other finish penalties
- [ ] Both mode
- [ ] Test overview (start/finish status per car)
- [ ] run_pairer + penalty_calculator + best_of_x
- [ ] Unit tests for pairer, penalties, best X of Y

- Bug: Start car of same number twice. Finish official cannot finish that car. Ignored?
- Bug: not clear how to fix a data entry, specifically a car number, mistake after start/stop.
- Bug: car picker at start not present/working.


### Sprint 3 — Timekeeper Admin (Week 5–6)

- [ ] Event setup (best_x_of_y, tests, categories)
- [ ] Entry management + category assignment
- [ ] Live feed (starts / finishes / in progress)
- [ ] Test results from paired events
- [ ] Multi-start / multi-finish averaging
- [ ] Override start/finish events and penalties
- [ ] Aggregate + category rankings
- [ ] Publish (local first; Matrix later)

### Sprint 4 — Competitor Results (Week 7)

- [ ] Results viewer with category tabs
- [ ] Per-test breakdown
- [ ] Late entry / withdraw / scratch
- [ ] DNS for withdrawn remaining tests
- [ ] Abandonment check (<50% tests)

### Sprint 5 — Matrix Integration (Week 8–9)

- [ ] Matrix client + rooms
- [ ] QR onboarding
- [ ] Sync start_events / finish_events → #timing
- [ ] Publish results → #results
- [ ] Offline queue + sync status

### Sprint 6 — Polish (Week 10)

- [ ] Error handling, offline-first UX
- [ ] Accessibility, performance
- [ ] Demo event data
- [ ] Integration test full lifecycle
- [ ] Field test at real event

---

## Deferred

| Feature | Target |
|---|---|
| Safety map / SOS | Phase 4 |
| BLE multihop | Phase 5 |
| Rally mode | v2 |
| Timing beams | v2 |
| POSSUM | v2 |
| Ed25519 signing | v2 |
| Element voice | v2 (native Element) |

---

## Related docs

- [docs/KhanacrossRules.md](docs/KhanacrossRules.md) — regs extract
- [docs/KhanacrossStopwatch.md](docs/KhanacrossStopwatch.md) — official UX detail
- [docs/research/Matrix.md](docs/research/Matrix.md) — comms layer
- [docs/research/Bluetooth.md](docs/research/Bluetooth.md) — multihop later
