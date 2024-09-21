import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopapp/app/utils/constants.dart';

class SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage({required this.storage});

  static const _tokenKey = tokenKey;
  static const _user = userKey;

  Future<bool> hasToken() async {
    var value = await storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> hasUser() async {
    var value = await storage.read(key: _user);
    if (value != null && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> deleteToken() async {
    return storage.delete(key: _tokenKey);
  }

  Future<void> deleteUser() async {
    return storage.delete(key: _user);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return storage.deleteAll();
  }
}
