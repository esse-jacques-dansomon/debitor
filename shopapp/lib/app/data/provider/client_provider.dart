import 'dart:convert';

import '../../utils/app_http_client.dart';
import '../model/client_model.dart';


class ClientProvider  {
  final AppHttpClient httpClient;

  ClientProvider({required this.httpClient});

  Future<List<Client>> getClients() async {
    final response = await httpClient.get('/clients');
    if (response.statusCode == 200) {
      return List<Client>.from(jsonDecode(response.body).map((x) => Client.fromJson(x)));
    } else {
      throw Exception('Failed to get clients ${response.body}');
    }
  }


}
