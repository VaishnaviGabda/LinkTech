import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:user_frontend/student/Tabs/home.dart';
import 'package:user_frontend/student/Tabs/login.dart';
import 'package:user_frontend/student/dashboard.dart';
import 'package:user_frontend/student/student.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 
  Widget build(BuildContext context) {
    TextEditingController sname = TextEditingController();
    TextEditingController scollege = TextEditingController();
    TextEditingController sdegree = TextEditingController();
    TextEditingController semail = TextEditingController();
    TextEditingController sphone = TextEditingController();

    Future<Student> saveData(String sname, String scollege, String semail,
        String sdegree, String sphone) async {
      // String c_id = id.toString();
      String uri = "http://localhost:3000/student/Register";
      final response = await http.post(Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "name": sname,
            "college": scollege,
            "email": semail,
            "degree": sdegree,
            "phone": sphone
          }));

      return dataFromJson(response.body);
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#0000FF"),
          title: Text('LinkTech'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
            child: Form(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(18),
              alignment: Alignment.topLeft,
              child: Text("Sign Up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#0000FF"))),
            ),
            SizedBox(
              height: 30,
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
                controller: sphone,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: " Enter your Phone No",
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
                      child: Text("Register",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ))),
                  color: HexColor("#0000FF"),
                  onPressed: () {
                    print(sdegree.text);
                    print(sname.text);

                    saveData(sname.text, scollege.text, semail.text,
                        sdegree.text, sphone.text);
                    print(sdegree.text);
                    print(sname.text);
                    sname.text = " ";
                    scollege.text = " ";
                    semail.text = " ";
                    sdegree.text = " ";

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Login(passname: sname.text)));
                  }),
            ),
          ],
        ))));
  }
}
