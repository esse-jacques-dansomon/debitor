import 'package:shopapp/app/data/model/user_model.dart';

class Client {
  final String telephone;
  final String surname;
  final User user;
  final int id;
  final String address;

  Client({
    required this.telephone,
    required this.surname,
    required this.user,
    required this.id,
    required this.address,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      telephone: json['telephone'],
      surname: json['surname'],
      user: User.fromJson(json['user']),
      id: json['id'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'telephone': telephone,
      'surname': surname,
      'user': user.toJson(),
      'id': id,
      'address': address,
    };
  }
}