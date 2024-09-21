import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopapp/app/utils/secure_storage.dart';

class AppHttpClient {
  final String baseUrl;
  final SecureStorage secureStorage;

  String token = '';

  AppHttpClient({
    required this.baseUrl,
    required this.secureStorage,
  });

  Future<void> _updateToken() async {
    token = await secureStorage.getToken() ?? '';
  }

  Future<http.Response> _sendRequest(
      Future<http.Response> Function() request) async {
    try {
      if (token.isNotEmpty) {
        _headers()['Authorization'] = 'Bearer $token';
        print("Token: " + token);
      }
      await _updateToken();
      final response = await request();
      _handleResponse(response);
      return response;
    } on SocketException {
      throw SocketException('No Internet connection');
    } on HttpException {
      throw HttpException('HTTP error');
    } on FormatException {
      throw FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final url =
        Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
    return _sendRequest(() => http.get(url, headers: _headers()));
  }

  Future<http.Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final url =
        Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
    return _sendRequest(
        () => http.post(url, headers: _headers(), body: jsonEncode(data)));
  }

  Future<http.Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final url =
        Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
    return _sendRequest(
        () => http.put(url, headers: _headers(), body: jsonEncode(data)));
  }

  Future<http.Response> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final url =
        Uri.parse('$baseUrl$uri').replace(queryParameters: queryParameters);
    return _sendRequest(
        () => http.delete(url, headers: _headers(), body: jsonEncode(data)));
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
    };
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode == 401) {
      print("Authentication4940 ${response}");
      // authBloc.add(LoggedOut()); // Notify bloc of logout
      throw const HttpException('Unauthorized request');
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw HttpException(
          'Failed request with status code: ${response.statusCode}');
    }
  }
}
