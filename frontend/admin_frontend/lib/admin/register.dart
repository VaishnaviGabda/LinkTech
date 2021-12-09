import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/login.dart';
import 'package:frontend/admin/menus/user.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<User> saveData(String email, String password) async {
    String uri = "https://linktech.herokuapp.com/adminlogin/signup";
    final response = await http.post(Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email, "password": password}));
    return userFromJson(response.body);
  }

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LinkTech", style: TextStyle(fontSize: 18)),
          backgroundColor: HexColor("#0000FF"),
        ),
        body: Container(
          // margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: ListView(
            padding: EdgeInsets.only(top: 120),
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.all(18),
                  alignment: Alignment.topLeft,
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#0000FF"))),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: " Enter email address",
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    controller: password,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: " Enter password",
                      hintStyle: TextStyle(fontSize: 14),
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: " Confirm password",
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(18),
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text("Sign Up",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ))),
                      color: HexColor("#0000FF"),
                      onPressed: () {
                        print(email.text);
                        print(password.text);

                        saveData(email.text, password.text);
                        print(email.text);
                        print(password.text);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      }),
                ),
              ])
            ],
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
