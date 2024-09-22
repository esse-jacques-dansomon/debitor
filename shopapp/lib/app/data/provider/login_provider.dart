import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopapp/app/data/model/auth_response_model.dart';
import 'package:shopapp/app/data/model/user_model.dart';

import '../../utils/app_http_client.dart';
import '../model/login_model.dart';

class LoginProvider  {
  final AppHttpClient httpClient;
  LoginProvider({required this.httpClient});


  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await httpClient.post(
        '/auth/login',
        body: LoginModel(usernameOrEmail: email, password: password).toJson(),
      );
      if (response.statusCode == 200) {
        print("response.body ${response.body}");
         final authResponse = AuthResponse.fromJson(
             jsonDecode(response.body) as Map<String, dynamic>);
         return authResponse;
      } else {
        throw Exception('Failed to login ${response.body}');
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login ${e.toString()}');
      throw Exception('Failed to login');
    }
  }

  Future<User> getUser() async {
    try {
      final response = await httpClient.get('/auth/me');
      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        return user;
      } else {
        throw Exception('Failed to get user');
      }
    } catch (e) {
      throw Exception('Failed to get user');
    }
  }


}
