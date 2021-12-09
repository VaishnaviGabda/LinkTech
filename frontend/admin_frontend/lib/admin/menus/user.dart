import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String email;
  String password;

  User({this.email: "abc", this.password: "abc"});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(email: json["email"], password: json["password"]);

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}

class Model {
  final String email;
  final String password;
  
  Model(this.email,this.password);
}