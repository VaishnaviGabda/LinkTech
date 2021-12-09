import 'dart:convert';



class Model {
  final String id;
  final String student_name;
  final String course_name;

  Model(this.id, this.student_name, this.course_name);
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  String id;
  String student_name;
  String course_name;
  Data({
    this.id: "abc",
    this.student_name: "abc",
    this.course_name: "abc",
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        student_name: json["student_name"],
        course_name: json["course_name"],
      );

  Map<String, dynamic> toJson() =>
      {"id": id, "student_name": student_name, "course_name": course_name};
}
