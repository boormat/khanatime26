import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class IdentityService {
  final FlutterSecureStorage _storage;

  IdentityService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  static const _key = 'official_id';

  Future<String> getOfficialId() async {
    var id = await _storage.read(key: _key);
    if (id == null) {
      id = _generateUuid();
      await _storage.write(key: _key, value: id);
    }
    return id;
  }

  String _generateUuid() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40; // version 4
    bytes[8] = (bytes[8] & 0x3f) | 0x80; // variant 1
    return _formatUuid(bytes);
  }

  String _formatUuid(List<int> bytes) {
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20)}';
  }
}
