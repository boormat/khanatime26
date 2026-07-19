# Khanacross — Stopwatch Mode Data Entry

> How an official records timing data using the phone app in manual stopwatch
> mode. Designed for the most common khanacross scenario: one official per
> stopwatch, start and finish at the same or nearby location.

---

## Context

A khanacross test is typically:
- Under 1 km, times 30–90 seconds
- Start and finish at the same spot (one official with a stopwatch) or at
  two nearby spots (two officials, each with a stopwatch)
- 2–4 officials timing each run for redundancy
- The official watches the car, starts the stopwatch at the start signal,
  stops it at the finish
- Times are written on a results sheet and walked/radioed to the timekeeper

The app replaces the paper results sheet. The official taps to start, taps
to stop, taps to record penalties, and the data syncs to the timekeeper
over WiFi or BLE.

---

## The Official's Workflow

### Before the event
1. Open the app (PWA in browser, or native app)
2. Scan QR code to join event WiFi and load event configuration
3. Select role: **Stopwatch Official**
4. Select test number (e.g., "Test 1")
5. Screen shows ready state, waiting for the next car

### During a run
1. **Car arrives at start line.** Official confirms car number verbally
   or reads it off the car
2. **Tap "Ready"** — app enters armed state, clock running in background
3. **Car starts.** Official taps "Start" — timestamp recorded as T₀
4. **Car finishes.** Official taps "Stop" — timestamp recorded as T₁
5. **Elapsed time = T₁ − T₀** displayed immediately on screen
6. Official notes any penalties observed (optional — can be done after)

### After a run
7. **Penalty entry** (if applicable):
   - Tap penalty button to add: wrong direction, missed stop, marker hit,
     reversed in garage, etc.
   - For marker hits: tap to increment count (1F, 2F, 3F...)
8. **Tap "Submit"** — entry saved locally and queued for sync to timekeeper
9. **Screen resets** to ready state for the next car

### Car number entry
- At any point before or during the run, the official enters the car number
- Large number pad for quick entry (car numbers are typically 1–999)
- Recent car numbers shown as quick-select buttons (most events run cars
  in a fixed order)

---

## Screen Layout

### Ready State

```
┌─────────────────────────────────┐
│  Test 1          Official: Mat  │
│                                 │
│         ┌───────────────┐       │
│         │   Car #___    │       │
│         │               │       │
│         │  [number pad] │       │
│         └───────────────┘       │
│                                 │
│    ┌────────────────────────┐   │
│    │     ▶ START            │   │
│    └────────────────────────┘   │
│                                 │
│  Last: Car 17 — 01:12.34 ✓    │
└─────────────────────────────────┘
```

- Large car number entry
- Start button is big and tappable without looking
- Shows last recorded time for confirmation

### Timing State (running)

```
┌─────────────────────────────────┐
│  Test 1          Official: Mat  │
│                                 │
│         Car #23                │
│                                 │
│      ┌─────────────────┐       │
│      │   00:23.47      │       │
│      │   ▶▶ RUNNING    │       │
│      └─────────────────┘       │
│                                 │
│    ┌────────────────────────┐   │
│    │     ⏹ STOP            │   │
│    └────────────────────────┘   │
│                                 │
│  Start: 10:23:45.12            │
└─────────────────────────────────┘
```

- Live elapsed time counting up
- Large stop button
- Shows start timestamp for reference

### Stopped State (time recorded)

```
┌─────────────────────────────────┐
│  Test 1          Official: Mat  │
│                                 │
│         Car #23                │
│                                 │
│      ┌─────────────────┐       │
│      │   01:12.34      │       │
│      │   ⏹ STOPPED     │       │
│      └─────────────────┘       │
│                                 │
│  Penalties:                     │
│  [+ Marker] [+ Wrong Dir]      │
│  [+ Missed Stop] [+ Reverse]   │
│  [NFG]  [DSQ]                   │
│                                 │
│  Current: 0 penalties          │
│                                 │
│    ┌────────────────────────┐   │
│    │     ✓ SUBMIT          │   │
│    └────────────────────────┘   │
│                                 │
│  [✗ Discard]                    │
└─────────────────────────────────┘
```

- Time locked — cannot be edited (immutable once stopped)
- Penalty buttons are clear and unambiguous
- Marker hit counter increments on tap: 1F → 2F → 3F
- Submit saves and syncs. Discard resets to ready state.

---

## Multi-Stopwatch Averaging

The regulations require at least 2 stopwatches per run, averaged. The app
handles this in two ways:

### Option A — One app per official (preferred)

Each official runs the app independently on their own phone. Each records
their own time. The timekeeper's admin view shows all submitted times per
run and auto-calculates the average.

```
Timekeeper's view — Test 1, Car 23:

  Official Mat:    01:12.34
  Official Sarah:  01:12.56
  Official Dave:   01:12.28
  ─────────────────────────
  Average:         01:12.39
  Penalties:       None
  Net time:        01:12.39
```

The timekeeper can override any individual time if a stopwatch malfunction
is suspected.

### Option B — One official records multiple stopwatches

If fewer than 2 phones are available, one official can start/stop two
stopwatch timers on the same phone. The UI adds a second timer button:

```
┌─────────────────────────────────┐
│         Car #23                │
│                                 │
│   SW 1:  00:00.00    [▶ START] │
│   SW 2:  00:00.00    [▶ START] │
│                                 │
└─────────────────────────────────┘
```

Both timers run independently. Average is computed locally on submit.

### Option C — Redundant recording, single official

One official records their time. A second official independently records
the same run. Both submit. The timekeeper reconciles.

This is the most common real-world scenario at grassroots events — often
only 1–2 officials are timing, and they may not both have phones.

---

## Penalty Types and Input

| Penalty | Button | Input | Calculation |
|---|---|---|---|
| Marker hit | `[+ Marker]` | Tap to increment count | +5.00 per marker |
| Wrong direction | `[Wrong Dir]` | Toggle on/off | Slowest + 5.00 |
| Missed mid-course stop | `[Missed Stop]` | Toggle on/off | Slowest + 5.00 |
| Reversed in garage | `[Reverse]` | Toggle on/off | Slowest + 5.00 |
| Failed to finish | `[DNF]` | Toggle on/off | Slowest + 5.00 |
| Not finished correctly | `[NFG]` | Toggle on/off | +5.00 + markers |
| Out of order | `[Out of Order]` | Toggle on/off | Slowest + 10.00 |
| Failed to present | `[DNS]` | Toggle on/off | Slowest + 10.00 |
| Failed to start in time | `[DNS]` | Toggle on/off | Slowest + 10.00 |
| Speed limit violation | `[DSQ]` | Toggle on/off | Disqualification |

**Note:** "Slowest time" penalties (WD, DNF, DNS, IM) cannot be computed
until all cars have run the test, because the slowest clean time is not
known until the test is complete. These penalties are stored as a flag
and resolved by the timekeeper when the test finishes.

---

## Data Submission Format

Each stopwatch submission is a structured entry:

```json
{
  "type": "stopwatch",
  "event_id": "khanacross_2025_001",
  "test": 1,
  "car": 23,
  "run": 1,
  "official": "did:key:z6Mk...",
  "timestamp_start": "2025-09-14T10:23:45.12Z",
  "timestamp_stop": "2025-09-14T10:24:57.46Z",
  "elapsed_ms": 72340,
  "penalties": [
    { "type": "marker_hit", "count": 1 }
  ],
  "penalty_ms": 5000,
  "net_ms": 77340,
  "status": "clean",
  "signature": "base64..."
}
```

This can be sent as a Matrix message to the `#timing` room, or stored
locally and synced via BLE.

---

## Best X of Y — Runs Per Test

Events define how many runs each car gets per test, and how many of those
count toward the result. This is configured per event in supplementary
regulations.

### Configuration

```
Event config:
  best_x_of_y: { x: 2, y: 3 }
  // Each car gets 3 attempts per test, best 2 count toward the result
```

| Setting | Meaning | Example |
|---|---|---|
| `y` (total allowed) | Maximum runs a car can attempt per test | 3 |
| `x` (counting) | Number of best runs that count toward the result | 2 |
| `x = y` | Every run counts (no discard) — standard khanacross | e.g. 1 of 1 |
| `x < y` | Worst run(s) discarded | 2 of 3, 3 of 5 |

**Standard khanacross** (per MA regulations) is effectively 1 of 1 — every
run counts, no discards. The `best_x_of_y` model is a superset that handles
both standard and multi-attempt events.

### Runs Per Test View

The official can switch from the stopwatch screen to the **Test Overview**
screen at any time. This shows the status of every car for the current test.

```
┌─────────────────────────────────────────┐
│  Test 1 — Best 2 of 3          ⏱ 14:22 │
│  ═══════════════════════════════════════ │
│                                         │
│  Car  Driver        R1      R2    R3   │
│  ─────────────────────────────────────  │
│   7   Smith         45.23   44.89  ·   │  ✓ Done (2/2 counting)
│  12   Jones         47.01   DNF    ·   │  ⚠ 1 counting (needs 2)
│  17   Williams      46.55   46.12  ·   │  ✓ Done (2/2 counting)
│  23   Brown         48.34    —     —   │  ○ 1 run only (2 remaining)
│  31   Davis          —      DNS    —   │  ✗ No valid runs
│  45   Taylor        46.78   45.90  45.33│  ✓ Done (2 of 3, best shown)
│  58   Wilson         —      —     —    │  ○ Not started (3 remaining)
│                                         │
│  ── Legend ──────────────────────────── │
│  ✓ Done   — enough counting runs       │
│  ⚠ Short — fewer than x counting runs  │
│  ○ Open   — has remaining attempts     │
│  ✗ None   — no valid runs recorded     │
│  ·         — not yet run               │
│  —         — exhausted / did not run   │
│  DNF/DNS   — penalty recorded          │
│                                         │
│  [◀ Back to Stopwatch]                  │
└─────────────────────────────────────────┘
```

### Status Definitions Per Car

| Status | Meaning | Visual |
|---|---|---|
| **Done** | Has `x` or more counting runs completed | Green ✓ |
| **Short** | Has fewer than `x` counting runs, may still attempt more | Amber ⚠ |
| **Open** | Has remaining attempts available (`runs_done < y`) | Blue ○ |
| **None** | Has attempted runs but none are counting (all penalties/DNF) | Red ✗ |
| **Finished** | Has attempted `y` runs, fewer than `x` counting — cannot improve | Gray — |

### How Counting Runs Are Determined

For each car on each test, the system:

1. Lists all runs submitted for that car on that test
2. Excludes runs with status DNF, DNS, DSQ (these never count)
3. Excludes runs with "slowest + N" penalties only if the penalty makes the
   net time worse than all clean runs — **but per regulations, penalty runs
   still count as a time** (they're just slow)
4. Sorts remaining runs by net time (ascending)
5. The best `x` runs are the counting runs
6. Remaining runs are discarded from the aggregate

**Example — Best 2 of 3:**

```
Car 23, Test 1:
  Run 1:  48.34s (clean)          → counts ✓
  Run 2:  53.12s (2 markers)      → discarded (3rd best)
  Run 3:  47.89s (clean)          → counts ✓

  Test time for Car 23 = 48.34 + 47.89 = 96.23s (best 2 of 3)
```

### Highlighting for Officials

The runs view uses colour and icons to help the official quickly assess
who still needs to run:

- **Row highlighted green** — car has completed enough counting runs,
  no more needed (but can still run if `y` not reached)
- **Row highlighted amber** — car has runs but not enough counting yet
- **Row highlighted red** — car has no valid runs, high priority to get them
  to the start line
- **Row dimmed** — car has exhausted all attempts or is DNS/withdrawn
- **Row normal** — car has attempts remaining and is progressing normally

The official can sort by status to see who is urgent (red/amber first)
or by car number for the running order.

---

## Competitor List and Entry Management

### Event Entry List

Before the event, the timekeeper (or event organiser) loads the entry list.
This can come from:

1. **Manual entry** — type in car numbers, driver names, classes
2. **CSV/JSON import** — from event management software or spreadsheet
3. **MSNZ POSSUM export** — if integrated (future)
4. **QR code at sign-on** — competitor scans QR, enters details, data
   syncs to the event database

The entry list defines who is expected at the event and what car/class
they are in.

### Entry List Structure

```json
{
  "entries": [
    {
      "car": 7,
      "driver": "Jane Smith",
      "class": "A",
      "licence": "Speed",
      "passenger": null,
      "status": "active",
      "registered_at": "2025-09-14T08:00:00Z"
    },
    {
      "car": 12,
      "driver": "Bob Jones",
      "class": "B",
      "licence": "Speed",
      "passenger": "Tom Jones (instructor)",
      "status": "active",
      "registered_at": "2025-09-14T08:15:00Z"
    }
  ]
}
```

### Status Values

| Status | Meaning | Effect on runs view |
|---|---|---|
| **active** | Competitor is entered and expected | Normal display, counts toward expected runs |
| **late_entry** | Entered after event started, joining mid-competition | Normal display, flagged as late entry |
| **withdrawn** | Withdrew during the event | Row dimmed, no longer expected at start line |
| **dns** | Did not start the event (no runs attempted) | Gray, noted in results |
| **scratched** | Removed from a specific test (e.g. car failure) | Gray for that test only |

### Late Entries

A competitor may arrive after the event has started. The official adds them
to the entry list:

```
┌─────────────────────────────────────────┐
│  Add Entry                              │
│                                         │
│  Car #:     [  42        ]              │
│  Driver:    [  Fred New   ]              │
│  Class:     [  B          ]              │
│  Passenger: [  None       ]              │
│  Status:    ● Active  ○ Late Entry      │
│                                         │
│  Join at test: [ 3  ] of 10             │
│                                         │
│    [ Add to Entry List ]                │
└─────────────────────────────────────────┘
```

The `join_at_test` field tells the system that Car 42 was not expected for
Tests 1–2. In the runs view for Tests 1–2, Car 42 does not appear. From
Test 3 onward, Car 42 appears as normal.

### Withdrawals

A competitor may withdraw mid-event (mechanical failure, personal reason).
The official updates their status:

```
┌─────────────────────────────────────────┐
│  Car 23 — Bob Brown                     │
│                                         │
│  Status:                                │
│  ● Active                               │
│  ○ Withdrawn (after Test 4)            │
│  ○ Scratched (Test 7 only)             │
│                                         │
│  Runs completed: 3 of 5 tests          │
│  Tests remaining: 5, 6, 7, 8, 9, 10   │
│                                         │
│  [ Update Status ]                      │
└─────────────────────────────────────────┘
```

When a car is withdrawn:
- They are removed from the expected start order for remaining tests
- In the runs view, their row is dimmed with a "W" indicator
- Their completed tests still count toward the result (aggregate time
  stands for tests already run)
- For remaining tests, they show as DNS automatically
- The timekeeper can override if the car re-enters

When a car is scratched from a specific test:
- They are removed from the start order for that test only
- They remain active for other tests
- The scratched test shows as DNS in their row

### How Withdrawals Affect Results

Per regulations, results are aggregate of elapsed times including penalties.
If a competitor withdraws after Test 5 of 10:
- Tests 1–5: times stand as recorded
- Tests 6–10: DNS penalty applied (slowest + 10 per test)
- Aggregate = sum of all 10 tests (5 actual + 5 DNS penalties)

The system handles this automatically: withdrawn competitors get DNS
penalties for remaining tests unless the timekeeper manually overrides
(e.g., if the event is abandoned and tests are not counted).

### Runs View With Entry Status

```
┌─────────────────────────────────────────┐
│  Test 6 — Best 2 of 3          ⏱ 15:40 │
│  ═══════════════════════════════════════ │
│                                         │
│  Car  Driver        R1      R2    R3   │
│  ─────────────────────────────────────  │
│   7   Smith         45.23   44.89  ·   │  ✓ Done
│  12   Jones         47.01   DNF    ·   │  ⚠ Short (1 counting)
│  17   Williams      46.55   46.12  ·   │  ✓ Done
│  23   Brown [W]      —      —     —    │  — Withdrawn after T5
│  31   Davis          —      DNS    —   │  ✗ No valid runs
│  42   New [LE]       —      —     —    │  ○ Late entry, joined T3
│  45   Taylor        46.78   45.90  ·   │  ✓ Done
│  58   Wilson         —      —     —    │  ○ Not started
│                                         │
│  7 cars expected  |  6 active           │
│  1 late entry     |  1 withdrawn        │
│                                         │
│  [◀ Back to Stopwatch]                  │
└─────────────────────────────────────────┘
```

---

## Edge Cases

### Multiple runs per car per test
The `best_x_of_y` model handles this. The official records all runs. The
system automatically picks the best `x` and discards the rest. The timekeeper
can override which runs count.

### Car does not start
Official taps DNS. No stopwatch time recorded. Penalty is slowest + 10.

### Car starts but does not finish
Official taps DNF after the car disappears (crash, mechanical failure).
Penalty is slowest + 5.

### Official misses the start
If the official is not ready and the car goes, they can:
- Tap "Late Start" — record the time with a flag for the timekeeper
- Discard and ask for a re-run (Clerk of Course decision)

### Official misses the finish
Same as above — tap "Late Stop" or discard.

### Two officials disagree significantly
The timekeeper can see both times in the admin view. If one is clearly
wrong (e.g., 10 seconds off), the timekeeper discards it and uses the
other, or averages the remaining times.

---

## Sync to Timekeeper

Each submission is saved locally first, then synced:

1. **WiFi available:** POST to Matrix homeserver immediately
2. **WiFi available but slow:** Queue locally, batch send every N seconds
3. **No WiFi:** Save locally, sync via BLE to nearby devices, which forward
   when they get connectivity
4. **No WiFi, no BLE:** Data stays on phone until connectivity returns.
   Official can also verbally relay the time to the timekeeper as backup.

The timekeeper's admin view updates in real time as submissions arrive,
showing which officials have submitted and which are pending.
