# Khanacross — Timing, Scoring & Results Rules

> Extracted from: Motorsport Australia Khanacross Standing Regulations
> (5.02-2025), effective 01/01/2025.
> Source PDF: `KhanacrossStandingRegulations2025.pdf`
> Full document: https://motorsport.org.au/wpblob0fe832abcb/wp-content/uploads/2023/12/5.02-2025-Khanacross-Standing-Regulations.pdf

---

## 1. Timing Rules

### 1.1 Precision

> Timing must be to 0.01 of a second. *(Rule 11.1)*

Times are recorded as `MM:SS.cc` (minutes, seconds, centiseconds). A typical
khanacross test is under 1 km with times around 30–90 seconds.

### 1.2 Start and Finish Points

> Timing will commence when the leading edge of the Automobile crosses the
> Start Line and end when it crosses the Finish Line. *(Rule 11.2)*

- **Start trigger:** front of car crosses the start line
- **Finish trigger:** front of car crosses the finish line
- Start and finish may be the same garage or two separate garages
  *(Rule 5.6)*

### 1.3 Timing Method

> Timing may be automatic or manual. If automatic timing is used the Organiser
> must provide manual timing as a back-up. *(Rule 11.3)*

> Manual timing must use at least 2 stopwatches each operated by a different
> official and the times recorded averaged which will be the Driver's elapsed
> time. *(Rule 11.4)*

**Key rule for the app:** If using manual/stopwatch mode, the system must:

1. Record at least 2 stopwatch times per run
2. Average the times to produce the elapsed time
3. If automatic timing is used, manual timing must still exist as backup

### 1.4 Display Requirement

> For each Test, the Organiser must display the time recorded for each Driver
> including any penalty imposed. *(Rule 11.5)*

---

## 2. Start and Finish Procedure

### 2.1 Starting

> Each Automobile must Start and finish each Test in a forward direction.
> *(Rule 10.5.1)*

> Prior to the commencement of the Test, an Automobile must be stationary,
> wholly within the boundaries of the start garage and behind the Start Line.
> *(Rule 10.5.2)*

> For the commencement and finish of a Test, the front wheels of the
> Automobile must precede the rear wheels across the Start Line and Finish
> Line. *(Rule 10.5.3)*

### 2.2 Finishing

> To finish correctly, an Automobile must cross the Finish Line between the
> markers and stop within the finish garage without displacing any marker.
> This manoeuvre must be completed without reversing. *(Rule 10.5.4)*

### 2.3 Failed Start

> A Driver will be deemed to have failed to attempt a Test if:
> - not arriving at the Start Line after being called twice by the officials;
>   or
> - having arrived at the Start Line, fails to Start within 1 minute of being
>   instructed to do so by an official. *(Rule 10.5.5)*

---

## 3. Penalties

All penalties are additive to a base time. The base time used depends on the
penalty type (see below). *(Rule 12.1)*

### 3.1 Penalty Table

| Infringement | Penalty | Abbreviation | Rule |
|---|---|---|---|
| Incorrectly completing a Test (wrong direction, reversing after exceeding garage limits, failing to stop in mid-course garage, failing to stop at finish) | Slowest time + 5 sec | WD | 12.1 |
| Did not finish | Slowest time + 5 sec | DNF | 12.1 |
| Stop at finish with any part of car outside garage | + 5 sec + any marker hit | NFG | 12.1 |
| Stop in mid-course garage with any part of car outside garage | + 5 sec | NFG | 12.1 |
| Exceeding speed limit in non-competition area | Up to Disqualification | DSQ | 12.1 |
| Running out of order without Clerk of Course approval | Slowest time + 10 sec | IM | 12.1 |
| Striking a marker | + 5 sec per marker | 1F, 2F etc | 12.1 |
| Failure to present at Start Line after being called twice | Slowest time + 10 sec | DNS | 12.1 |
| Failure to Start within 1 minute of arriving at Start Line | Slowest time + 10 sec | DNS | 12.1 |

### 3.2 Penalty Calculation Rules

> "Plus 5 seconds" means 5 seconds added to the time recorded by that Driver
> on that Test. *(Rule 12.2)*

> "Slowest time plus 5 seconds" means 5 seconds added to the overall slowest
> time recorded in that Test by a Driver without a Passenger. *(Rule 12.3)*

> "Slowest time plus 10 seconds" means 10 seconds added to the overall
> slowest time recorded in that Test by a Driver without a Passenger.
> *(Rule 12.4)*

**Important:** "Slowest time" is always from a Driver **without a Passenger**.
Passenger runs are excluded when calculating slowest time for penalty base.

### 3.3 Edge Cases

> If the overall fastest or slowest time includes a penalty, then the next
> fastest or slowest time without a penalty will be applied. *(Rule 12.5)*

> If the "slowest time plus 5 seconds" exceeds twice the overall fastest
> time, the time applied will be twice the overall fastest time. *(Rule 12.6)*

**This caps the penalty.** If the fastest clean time is 45.00s, the maximum
penalty time from a "slowest + 5" is 90.00s (2 × 45.00), not 95.00s
(assuming slowest was 90.00).

### 3.4 Penalty Calculation Algorithm

For the app to compute penalties correctly:

```
function penaltyTime(type, driverTime, testResults):
    switch(type):
        case "PLUS_5":
            return driverTime + 5.00

        case "PLUS_5_MARKER":
            return driverTime + 5.00 + (markers * 5.00)

        case "SLOWEST_PLUS_5":
            base = slowestCleanTime(testResults)  // no passengers
            penalty = base + 5.00
            fastest = fastestCleanTime(testResults)
            cap = fastest * 2.0
            return min(penalty, cap)

        case "SLOWEST_PLUS_10":
            base = slowestCleanTime(testResults)
            penalty = base + 10.00
            fastest = fastestCleanTime(testResults)
            cap = fastest * 2.0
            return min(penalty, cap)

function slowestCleanTime(results):
    // Filter to drivers WITHOUT passengers
    // If all include penalties, use next clean time (Rule 12.5)
    clean = results.filter(r => !r.passenger && !r.penalty)
    if clean.length == 0:
        clean = results.filter(r => !r.passenger)
    return max(clean.time)

function fastestCleanTime(results):
    clean = results.filter(r => !r.penalty)
    return min(clean.time)
```

---

## 4. Results

### 4.1 Aggregate Scoring

> Results will be determined by the aggregate of the elapsed time including
> any penalty/s of each Test by each Driver with the winner being the Driver
> having the lowest aggregate time. *(Rule 13.1)*

**Simple sum.** No points system. The winner has the lowest total time across
all tests. Results = Σ (test time + penalties) for each test.

### 4.2 Ties

> If there are equal aggregate times, the tied Drivers must be declared joint
> placegetters. *(Rule 13.1)*

No tie-breaker. Equal times = joint position.

### 4.3 Event Abandonment

> If fewer than 50 percent of the scheduled number of Tests are conducted,
> the Event will be abandoned. *(Rule 10.1.1)*

If 10 tests are scheduled and only 4 are completed, the event is abandoned
and no results are official.

---

## 5. Classes

Automobile classes are defined in Auto Test Appendix – Group 4K Khanacross
Technical Regulations (separate document). The Supplementary Regulations
may include additional classes for Drivers. *(Rule 7.3)*

Classes are relevant to results: results are typically displayed overall
and by class.

---

## 6. Data Model Implications

Based on the rules above, the app needs to track:

### Per Event
- Event name, date, organiser
- List of tests (name/number, course description)
- Number of scheduled tests (for abandonment check)
- Supplementary Regulations (any additional rules)

### Per Test
- Test number/name
- Course diagram (optional)
- Start type: same garage (stopwatch) or separate garages (wall clock)

### Per Car Entry
- Car number
- Driver name, licence, class
- Passenger name (if applicable)
- Automobile details

### Per Run (one car, one test)
- Car number
- Test number
- Run number (car may have multiple attempts per test)
- Stopwatch times (minimum 2, from different officials)
- Elapsed time (averaged from stopwatches, or automatic timing)
- Penalties observed (type, count)
- Penalty time (computed from type + count + test results)
- Net time (elapsed + penalty)
- Status: clean, WD, DNF, NFG, DSQ, IM, DNS

### Per Result
- Driver aggregate time (sum of net times across all tests)
- Overall position (ranked by aggregate, lowest first)
- Class position
- Ties: joint placegetters
