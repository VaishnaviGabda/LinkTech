import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UploadNewCourse extends StatefulWidget {
  const UploadNewCourse({Key? key}) : super(key: key);

  @override
  _UploadNewCourseState createState() => _UploadNewCourseState();
}

class _UploadNewCourseState extends State<UploadNewCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextField(
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
          child: TextField(
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
          child: TextField(
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
          child: TextField(
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
              onPressed: () {}),
        ),
      ],
    )));
  }
}