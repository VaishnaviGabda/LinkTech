import 'dart:convert';

class Model {
  final String name;
  final String duration;
  final String fees;
  final String seats;
  Model(this.name, this.duration, this.fees, this.seats);
}

Student dataFromJson(String str) => Student.fromJson(json.decode(str));

String dataToJson(Student data) => json.encode(data.toJson());

class Student {
  String name;
  String duration;
  String fees;
  String seats;
  Student(
      {this.name: "abc",
      this.duration: "abc",
      this.fees: "abc",
      this.seats: "abc"});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json["name"],
        duration: json["duration"],
        fees: json["fees"],
        seats: json["seats"],
      );

  Map<String, dynamic> toJson() =>
      {"name": name, "duration": duration, "fees": fees, "seats": seats};
}
