import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shopapp/app/data/model/auth_response_model.dart';
import 'package:shopapp/app/utils/constants.dart';

class SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage({required this.storage});

  static const _tokenKey = tokenKey;
  static const _user = userKey;
  static const hasSeenWelcomeKey = hasSeenWelcomeKeyKey;

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
    return  storage.deleteAll();
  }

  void persistUserAndToken(AuthResponse authResponse) {
    storage.write(key: _tokenKey, value: authResponse.accessToken);
    storage.write(key: _user, value: jsonEncode(authResponse.user));
  }

  void persistHasSeenWelcome(bool bool) {
    storage.write(key: hasSeenWelcomeKey, value: bool.toString());
  }


  Future<bool?> getHasSeenWelcome() async {
    var value = await storage.read(key: hasSeenWelcomeKey);
    if (value == 'true') {
      return true;
    }
    return false;
  }
}
