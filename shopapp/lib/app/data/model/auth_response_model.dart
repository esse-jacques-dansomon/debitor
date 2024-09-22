import 'package:shopapp/app/data/model/user_model.dart';

class AuthResponse {
  final String accessToken;
  final String tokenType;
  final User user;

  AuthResponse({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  AuthResponse copyWith({
    String? accessToken,
    String? tokenType,
    User? user,
  }) =>
      AuthResponse(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        user: user ?? this.user,
      );

  factory AuthResponse.fromJson(dynamic json) => AuthResponse(
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
        user: User.fromJson(json["user"]),
      );

  factory AuthResponse.fromJson2(dynamic json) => AuthResponse(
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "tokenType": tokenType,
        "user": user.toJson(),
      };
}
