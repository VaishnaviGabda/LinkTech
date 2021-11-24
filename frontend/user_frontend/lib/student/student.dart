import 'dart:convert';

class Model {
  final String name;
  final String college;
  final String email;
  final String degree;
 // final String phone;
  Model(this.name, this.college, this.email, this.degree);
}

Student dataFromJson(String str) => Student.fromJson(json.decode(str));

String dataToJson(Student data) => json.encode(data.toJson());

class Student {
  String name;
  String college;
  String email;
  String degree;
 // String phone;
  Student(
      {this.name: "abc",
      this.college: "abc",
      this.email: "abc",
      this.degree: "abc",
     // this.phone: "abc"
     });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      name: json["name"],
      college: json["college"],
      email: json["email"],
      degree: json["degree"],
      //phone: json["phone"]
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "college": college,
        "email": email,
        "degree": degree,
        //"phone": phone
      };
}
