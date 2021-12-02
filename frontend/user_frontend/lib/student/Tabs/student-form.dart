import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:user_frontend/student/Tabs/home.dart';
import 'package:user_frontend/student/student.dart';

class StudentForm extends StatelessWidget {
  String passname, id;
  StudentForm({required this.id, required this.passname});

  Widget build(BuildContext context) {
    TextEditingController sname = TextEditingController();
    TextEditingController scollege = TextEditingController();
    TextEditingController sdegree = TextEditingController();
    TextEditingController semail = TextEditingController();
    Future<Student> saveData(
        String sname, String scollege, String semail, String sdegree) async {
      print(id);
      // String c_id = id.toString();
      String uri = "https://linktech.herokuapp.com/student/add_new_student$id";
      final response = await http.post(Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "name": sname,
            "college": scollege,
            "email": semail,
            "degree": sdegree
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
          child: Text("Enroll Now For " + passname + " Course",
              style: TextStyle(
                  color: HexColor("#0000FF"),
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: sname,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter your name",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: scollege,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter college name",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: semail,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter your email",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            controller: sdegree,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: " Enter your Ongoing Degree",
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(18),
          alignment: Alignment.topLeft,
          child: RaisedButton(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Send Request",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ))),
              color: HexColor("#0000FF"),
              onPressed: () {
                print(sdegree.text);
                print(sname.text);

                saveData(sname.text, scollege.text, semail.text, sdegree.text);
                print(sdegree.text);
                print(sname.text);
                sname.text = " ";
                scollege.text = " ";
                semail.text = " ";
                sdegree.text = " ";

                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Home()));
              }),
        ),
      ],
    ))));
  }
}
