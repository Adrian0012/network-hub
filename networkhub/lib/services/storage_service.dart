import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static StorageService? _instance;

  StorageService._() : _cache = <String, String>{} {
    _instance = this;
  }

  factory StorageService.instance() => _instance ?? StorageService._();

  Map<String, String> _cache;

  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions get _getAndroidOptions =>
      const AndroidOptions(encryptedSharedPreferences: true);

  Future<String?> read({required String key}) async {
    if (_cache.containsKey(key)) {
      return Future.value(_cache[key]);
    }
    return _secureStorage.read(key: key, aOptions: _getAndroidOptions);
  }

  Future<bool> containsKey({required String key}) async =>
      _cache.containsKey(key) || await _secureStorage.containsKey(key: key);

  Future<void> write(
      {required String key, required String value, bool cache = true}) async {
    await _secureStorage.write(
        key: key, value: value, aOptions: _getAndroidOptions);
    if (cache) {
      _cache[key] = value;
    }
  }

  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions);
    if (_cache.containsKey(key)) {
      _cache.remove(key);
    }
  }
}
