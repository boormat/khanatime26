# Khanatime26 — Planning Document

> Last updated: 2026-07-19
> Status: Research phase — requirements gathering, architecture exploration

---

## Project Goals

Develop applications for Rally and Khanacross result collection, merging, and
publishing event results. Possibly two applications sharing a common deployment
and communications mechanism.

Key constraints:
- Low budget motorsport events with unpaid volunteer officials
- Officials are often non-technical, reluctant to install apps
- Small downloads, works on slow data connections
- Must work with intermittent or no phone coverage
- Phone-only (no extra equipment like WiFi routers)
- Low battery usage desired
- Maximum resilience through data duplication across all devices

---

## Distribution Tiers

### Tier 1: App Store — Existing Open Source App (Comms Layer)
Use an app officials can install from the store for chat, voice, and
store-and-forward messaging.

**Primary candidate: Matrix/Element**
- Element on iOS and Android app stores
- Local homeserver (Continuwuity) on timekeeper's laptop: ~150MB RAM
- Works completely offline over local WiFi (air-gapped proven — military use)
- Native voice messaging, VoIP calls (Element Call / LiveKit)
- Full API for bots and structured data (appservice protocol)
- E2EE by default
- Store-and-forward built in (server stores, clients sync when connected)
- Multiple client options (Element, Element X, FluffyChat, SchildiChat)

**Deployment at events:**
```
[Portable WiFi AP] ← Local LAN (no internet)
       |
[Laptop/Mini-PC]
  - Continuwuity homeserver (~150MB RAM, single binary, embedded RocksDB)
  - Element Web served locally
  - Optional: ntfy for local push notifications
  - Optional: maubot for timing data bots
       |
  +----+----+----+----+
  |    |    |    |    |
[Officials] [Officials] [Competitors] [Race Control]
  Element X  Element X  Element X     Element Web
  (mobile)   (mobile)   (mobile)      (desktop)
```

**Other candidates considered:**
- Mattermost: Heavier (500MB+ RAM), no native mobile voice messaging, DDIL support
- Rocket.Chat: Air-gapped requires license, heavy (MongoDB replica set)
- Zulip: Poor mobile offline, no voice messaging
- Signal: Cannot self-host in practice
- Briar: Android only, no voice, no structured API

**Berty (needs further evaluation):**
- P2P messaging built on Wesh Protocol (IPFS + OrbitDB)
- iOS and Android app stores, Apache-2.0 / MIT license
- Offline via BLE + WiFi Direct (Android Nearby / Multipeer Connectivity)
- gRPC API with bot support — can send structured data programmatically
- Self-hostable (rendezvous points, replication nodes, relay nodes)
- Voice messages supported
- **Strengths:** True offline P2P, no servers required, E2EE, CRDT-based eventual consistency
- **Limitations:**
  - BLE range ~30m practical — too short for across-venue coverage
  - No true multihop mesh routing
  - No desktop GUI (CLI only)
  - Early-to-mid beta, ~10 person team, protocol not audited
  - Poor scalability in large groups (O(n) key exchange)
  - No member removal from groups, no message deletion
  - Higher battery consumption
- **Verdict:** Reasonable complement for proximity-based comms (single garage/team),
  but not suitable as primary event communication system. Matrix/Element is more
  practical for the overall event. Could investigate Berty's Wesh Protocol
  for the offline P2P transport layer underneath.

### Tier 2: PWA — Results Viewing
Lightweight PWA for competitors/spectators to view results when at HQ over
WiFi or from timekeeper's device. Also serves as UI layer for the native app.

**PWA limitations (confirmed blockers for primary transport):**
- No background sync on iOS
- No Bluetooth peer-to-peer on iOS
- No WiFi Direct access
- No background location on either platform
- No SMS access
- 7-day storage eviction on iOS
- Unreliable push notifications on iOS

**PWA is suitable for:**
- Results display (when connected to local WiFi)
- UI layer inside native wrapper (Capacitor/WebView)
- Data entry when app is in foreground

### Tier 3: Sideload — Timekeeper/Delegate Power Tool
Native app sideloaded onto key officials' devices:
- Runs local web server to serve PWA
- Acts as central results database
- Admin UI for reviewing, adjusting, finalizing results
- Bridge data into Matrix bot for publishing
- Full audit log management

---

## Identity and Cryptography

### Key Management
- **Algorithm:** Ed25519 (RFC 8032)
- **Persistence:** Keys persist across events (officials build identity over time)
- **Generation:** Each app instance generates a keypair on first launch
- **Storage:**
  - PWA: Web Crypto API CryptoKey objects in IndexedDB (non-extractable)
  - iOS: CryptoKit + Keychain (+ Secure Enclave on iOS 15+)
  - Android: Keystore API 33+ or BouncyCastle wrapper + EncryptedSharedPrefs
  - Fallback: @noble/ed25519 (3.9KB, audited, MIT)
- **QR Exchange:** Public key encoded as `did:key:z6Mk...` (W3C standard, ~55 chars)
- **Libraries:** noble-ed25519, react-native-quick-crypto, Flutter cryptography package

### Signing Model
- Every data submission signed by submitter's private key
- Signature + public key reference attached to each submission
- Timekeeper signs the **derived results** (not individual raw data)
- All data always accepted and logged (unsigned or signed)

### Identity Verification
- Out-of-band: QR code scan, voice call, in-person
- Matrix device verification (SAS / QR) can complement
- Fingerprint comparison (first 8 hex chars) for quick verification

### Trust Model
- Any authorized official can authorize new keys
- Timekeeper can revoke keys
- Emergency: all data accepted regardless of signature status
- Timekeeper role is transferable during event

---

## Data Streams

### Stream 1: Timing Data
- Officials → Timekeeper → All
- Small volume, high priority
- Signed by official, reviewed/adjusted by timekeeper
- Timekeeper signs final derived results

### Stream 2: Results
- Timekeeper → All
- Small volume, high priority
- Signed by timekeeper
- Published via Matrix room

### Stream 3: Location Tracking (High Volume — Compacted)
- Competitors → Safety Official
- GPS captures every N seconds
- **Network sync:** Only last known location per competitor (~80 bytes/update)
- **Full logs:** Retained locally on device, transferred directly to timekeeper only
- Compaction: older location data pruned from network sync payload

### Stream 4: Safety Messages
- Any → Safety Official
- Small volume, **critical** priority
- Location-tagged, signed
- Types: crash, medical, road_condition, sos, info
- SMS-capable encoding: ~100-150 chars

### Stream 5: Chat / Voice
- All ↔ All
- Medium volume, low priority
- Handled by Element/Matrix

---

## Multihop Store-and-Forward

### Architecture
Data hops through multiple devices to reach HQ. No single device needs direct
connectivity to the timekeeper. Each official and competitor carries all data
they've seen and syncs with anyone nearby.

### Human Relay Network
Competitors physically travel between isolated officials. Their phones carry
all data seen so far and sync via Bluetooth/WiFi Direct when arriving at
checkpoints.

```
Start Official → (BT) → Competitor car → (BT) → Mid-stage Official
                              |                        |
                              v                        v
                       Carry all data           Forward to next
                       seen so far              competitor/official
                              |                        |
                              v                        v
                       Finish Official → (WiFi) → HQ / Timekeeper
```

### Transport Priority
1. **Local WiFi / Matrix** — Primary when connected
2. **Bluetooth / WiFi Direct** — Nearby sync (stage start↔finish)
3. **Cellular data** — Store-and-forward when signal returns
4. **SMS** — Last resort (satellite SMS on newer phones)
5. **Manual file** — Emergency (USB/airdrop)

### SMS Encoding
```
KT:<event_id>:<test>:<car>:<time_ms>:<penalties>:<sig_prefix>
```
~60-80 chars per timing submission. ~100-150 chars for safety messages.

---

## Store-and-Forward / Mesh Research

### Current State (July 2026)
No production-ready, cross-platform, phone-only multihop mesh exists.
iOS is the bottleneck (background BLE restrictions, AWDL instead of WiFi Direct,
deprecated Multipeer Connectivity).

### Candidates

| Solution | Cross-Platform | Multihop | Store-and-Forward | Maturity | Notes |
|----------|---------------|----------|-------------------|----------|-------|
| @offline-protocol/mesh-sdk | iOS + Android | Yes | Yes | Early (v0.10) | React Native, Rust core, BLE + WiFi + Reticulum |
| Meshrabiya | Android only | Yes (true WiFi) | Yes | Early | 300Mbps, LGPL-3.0 |
| Bridgefy SDK | iOS + Android | Yes | Yes | Moderate | **Proprietary**, per-user pricing |
| Briar | Android only | Yes | Yes | High (maintenance) | GPLv3, P2P, no iOS |
| Berty | iOS + Android | Partial | Yes | Moderate | P2P via IPFS, BLE + WiFi, early beta |
| iOS WiFi Aware | Cross-platform potential | No (P2P only) | No | Brand new | iOS 26+, ~20 MB/s, future potential |

### P2P Communication Technology Matrix

| Technology | Android | iOS | Background iOS | Throughput |
|-----------|---------|-----|----------------|------------|
| Nearby Connections | Full | Limited (WiFi LAN) | Limited | 50-150 Mbps |
| WiFi Direct | Full | Not supported | No | 50-150 Mbps |
| WiFi Aware (NEW) | Supported | iOS 26+ | Yes (paired) | ~20 MB/s |
| Core Bluetooth | Full | Full (UUID filter) | Yes (throttled) | ~1 MB/s |
| BLE phone-to-phone | 50-140 KB/s | ~50 KB/s | — | ~0.5 Mbps |

### Cross-Platform P2P Today
- iOS-to-Android P2P is limited to BLE speeds (~0.5 Mbps)
- WiFi Aware cross-platform is the future path but not ready
- Matrix sync is the reliable fallback for connected devices

---

## Ed25519 Crypto Libraries

| Platform | Key Gen + Sign | Secure Storage | QR Generation | QR Scanning |
|----------|---------------|----------------|---------------|-------------|
| iOS | CryptoKit | Keychain | Any QR lib | AVFoundation |
| Android | Keystore (API 33+) | Keystore + EncryptedSharedPrefs | Any QR lib | ZXing / ML Kit |
| PWA | Web Crypto API + noble fallback | IndexedDB (CryptoKey) | qrcode.react | html5-qrcode |
| React Native | react-native-quick-crypto | expo-secure-store | react-qr-code | react-native-vision-camera |
| Flutter | cryptography package | flutter_secure_storage | qr_flutter | mobile_scanner |

### Matrix Identity Integration
- Matrix already uses Ed25519 for device fingerprint keys
- Cross-signing hierarchy: Master → Self-Signing → User-Signing
- Element supports SAS and QR verification
- **Recommendation:** Keep separate application keypair, use Matrix verification for OOB trust

---

## Existing Motorsport Software Survey

### What Exists (Open Source)
| Project | Value | Status |
|---------|-------|--------|
| `race-time` (boormat) | Khanacross data model study | Archived, Meteor.js |
| `timing71/livetiming-core` | CTD format, plugin architecture, relay | Active, Python |
| `skoky/OpenRaceTiming` | Modular architecture concept | Concept only |
| `cpvalente/ontime` | Live results display patterns | Active, 913 stars |
| `LateralGs/rallyx_timing_scoring` | RallyCross scoring logic | Club-tested |
| `Kiasersosa/rally-commander` | Rally team management, Next.js | Pre-alpha |
| `RotorHazard` | FPV drone timing, plugin system | Active, 258 stars |

### What Doesn't Exist
- No open-source khanacross timing system (stopwatch, multiple officials)
- No open-source stage rally timing (wall-clock, start/finish separation)
- No combined khanacross + rally system

### Proprietary References
- **RallySafe** — Gold standard for ANZ rally timing (GPS tracking, live results, satellite comms)
- **Rally Scoring** — Dominant North American rally scoring
- **MSNZ POSSUM** — Event management (not timing)

---

## Roles

| Role | Device | Responsibilities |
|------|--------|-----------------|
| Timekeeper | Sideload + PWA | Signs results, manages keys, full audit log, can be transferred mid-event |
| Safety Official | Sideload or PWA | Real-time location map, receives safety messages |
| Stage Official | PWA | Records timing data, relays data via multihop |
| Competitor | PWA | Views results, carries data, reports location, can swap to official |

---

## Open Questions / TODO

- [ ] Decision: React Native vs Flutter vs Capacitor vs Tauri Mobile
- [ ] Decision: Matrix primary + mesh later, or invest in mesh from start
- [ ] Decision: Khanacross first, or both modes from start
- [ ] Deeper investigation of Berty's Wesh Protocol for offline transport layer
- [ ] How to handle the timekeeper role transfer mid-event technically?
- [ ] How does the safety official's location map UI work in practice?
- [ ] Integration with MSNZ POSSUM for event entries/results submission?
- [ ] Data model design: events, tests, competitors, timing records, penalties
- [ ] What happens when multiple timekeepers exist (assistant timekeeper)?
- [ ] How to handle results disputes and audit trail?
- [ ] Competitor self-registration flow?
- [ ] How to handle event configuration (number of tests, classes, etc.)?
