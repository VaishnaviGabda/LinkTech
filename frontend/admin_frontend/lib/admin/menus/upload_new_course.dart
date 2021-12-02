import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/Home/dashboard.dart';
import 'package:frontend/admin/menus/data.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UploadNewCourse extends StatefulWidget {
  const UploadNewCourse({Key? key}) : super(key: key);

  @override
  _UploadNewCourseState createState() => _UploadNewCourseState();
}

class _UploadNewCourseState extends State<UploadNewCourse> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cname = TextEditingController();
    TextEditingController cduration = TextEditingController();
    TextEditingController cfees = TextEditingController();
    TextEditingController cseats = TextEditingController();
    Future<Data> saveData(
        String cname, String cduration, String cfees, String cseats) async {
      String uri = "https://linktech.herokuapp.com/admin/add_new_course";
      final response = await http.post(Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "name": cname,
            "duration": cduration,
            "fees": cfees,
            "seats": cseats
          }));
      return dataFromJson(response.body);
    }

    return Scaffold(
        body: Container(
            child: Form(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: cname,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter course name",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: cduration,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter duration",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: cfees,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter fees",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: cseats,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter total seats",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(18),
          alignment: Alignment.topLeft,
          child: RaisedButton(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Upload New Course",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ))),
              color: HexColor("#0000FF"),
              onPressed: () {
                print(cseats.text);
                print(cname.text);

                saveData(cname.text, cduration.text, cfees.text, cseats.text);
                print(cseats.text);
                print(cname.text);
                cname.text = " ";
                cduration.text = " ";
                cfees.text = " ";
                cseats.text = " ";

                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Dashboard()));
              }),
        ),
      ],
    ))));
  }
}
