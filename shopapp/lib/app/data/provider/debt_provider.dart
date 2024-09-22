import 'dart:convert';
import 'package:shopapp/app/data/model/debt_model.dart';

import '../../utils/app_http_client.dart';

class DebtProvider  {
  final AppHttpClient httpClient;
  DebtProvider({required this.httpClient});

  Future<List<Debt>> getShopperDebts(String shopperId) async {
    final response = await httpClient.get('/debts/user/$shopperId');
    if (response.statusCode == 200) {
      final debts = List<Debt>.from(jsonDecode(response.body).map((x) => Debt.fromJson(x)));
      return debts;
    } else {
      throw Exception('Failed to get debts ${response.body}');
    }
  }

}
