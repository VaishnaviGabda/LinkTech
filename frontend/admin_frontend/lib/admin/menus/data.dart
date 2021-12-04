import 'dart:convert';

class Model {
  final String name;
  final String duration;
  final String fees;
  final String seats;
  Model(this.name, this.duration, this.fees, this.seats);
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  String name;
  String duration;
  String fees;
  String seats;
  Data(
      {
      this.name :"abc",
      this.duration :"abc",
      this.fees : "abc",
      this.seats :"abc"
      });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        duration: json["duration"],
        fees: json["fees"],
        seats: json["seats"],
      );

  Map<String, dynamic> toJson() =>
      {"name": name, "duration": duration, "fees": fees, "seats": seats};
}

