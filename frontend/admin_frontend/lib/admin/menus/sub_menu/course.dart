import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  String name;
  
  Course(
      {
      this.name :"abc",
      });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        name: json["name"],
      );

  Map<String, dynamic> toJson() =>
      {"name": name};
}

