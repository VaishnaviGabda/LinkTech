import 'dart:convert';

class Model {
  final String name;
  final String duration;
  final String fees;
  final String seats;
  final String id;
  
  Model(this.id,this.name, this.duration, this.fees, this.seats);
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  String id;
  String name;
  String duration;
  String fees;
  String seats;
  Data(
      {this.id: "abc",
      this.name: "abc",
      this.duration: "abc",
      this.fees: "abc",
      this.seats: "abc"});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        fees: json["fees"],
        seats: json["seats"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "fees": fees,
        "seats": seats
      };
}
