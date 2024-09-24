import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shopapp/app/data/model/auth_response_model.dart';
import 'package:shopapp/app/data/model/user_model.dart';
import 'package:shopapp/app/utils/constants.dart';

import '../provider/app_http_client.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';

class LoginRepository  {
  final AppHttpClient httpClient;
  LoginRepository({required this.httpClient});


  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await httpClient.post(
        '/auth/login',
        body: LoginModel(usernameOrEmail: email, password: password).toJson(),
      );
      if (response.statusCode == 200) {
         final authResponse = AuthResponse.fromJson(
             jsonDecode(response.body) as Map<String, dynamic>);
         return authResponse;
      } else {
        throw Exception('Failed to login ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to login ${e.toString()}');
    }
  }

  Future<User> getUser() async {
    final response = await httpClient.get('/auth/me');

    try {
      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body));
        return user;
      } else {
        throw Exception('Failed to get user ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to get user ${e.toString()}');
    }
  }

  Future<void> logout() async {
    final response = await httpClient.post('/users');

    if (response.statusCode == 200) {
     // Get.delete<LoginRepository>();
    } else {
      throw Exception('Failed to logout ${response.body}');
    }
  }

  register(String email, String password,File file) async {
    RegisterModel registerModel = RegisterModel(email: email, password: password);
    Dio dio = Dio();
    final formData = FormData();
    formData.files.add(MapEntry('file', await MultipartFile.fromFile(file.path, filename: file.path.split('/').last)));
    formData.fields.add(MapEntry('user', jsonEncode({
      "email" : registerModel.email,
      "password" : registerModel.password
    })));
    var api = "$apiBaseUrl/users";
    return dio.post(api, data: formData);
  }

}
