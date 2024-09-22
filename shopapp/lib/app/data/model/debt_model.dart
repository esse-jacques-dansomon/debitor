import 'package:shopapp/app/data/model/user_model.dart';

import 'client_model.dart';

class Debt {
  final double amount;
  final Client client;
  final bool paid;
  final User shopper;
  final String date;
  final int id;

  Debt({
    required this.amount,
    required this.client,
    required this.paid,
    required this.shopper,
    required this.date,
    required this.id,
  });

  factory Debt.fromJson(Map<String, dynamic> json) {
    return Debt(
      amount: json['amount'],
      client: Client.fromJson(json['client']),
      paid: json['paid'],
      shopper: User.fromJson(json['shopper']),
      date: json['date'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'client': client.toJson(),
      'paid': paid,
      'shopper': shopper.toJson(),
      'date': date,
      'id': id,
    };
  }
}
