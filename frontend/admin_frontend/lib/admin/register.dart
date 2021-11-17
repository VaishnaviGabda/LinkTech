import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/login.dart';
import 'package:hexcolor/hexcolor.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
