
class User {
  String email;
  String role;
  String photo;
  int id;

  User({
    required this.email,
    required this.photo,
    required this.role,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    photo: json["photo"],
    role: json["role"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "photo": photo,
    "role": role,
    "id": id,
  };
}
