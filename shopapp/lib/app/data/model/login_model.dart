class LoginModel {
  String usernameOrEmail;
  String password;

  LoginModel({required this.usernameOrEmail, required this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usernameOrEmail'] = usernameOrEmail;
    data['password'] = password;
    return data;
  }
}

