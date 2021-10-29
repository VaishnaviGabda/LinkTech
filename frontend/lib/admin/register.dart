import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: ListView(
        padding: EdgeInsets.only(top: 120),
        children: [Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  hintText: " Enter email address",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  hintText: " Enter password",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  hintText: " Confirm password",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(18),
            alignment: Alignment.topLeft,
            child: RaisedButton(
              child: Container(padding: EdgeInsets.all(10),child: Text("Sign Up",style: TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.w400,))),
              color: HexColor("#0000FF"),
              onPressed: (){}),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.only(right: 18),
            alignment: Alignment.topLeft,
            child: RaisedButton(
              child: Row(
                children: [
                  Image.asset("images/google_logo.png",width:50),
                  Container(padding: EdgeInsets.all(8),child: Text("Sign Up with Google",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,))),
                ],
              ),
              color: Colors.white,
              onPressed: (){}),
          ),
          Container(
            margin: EdgeInsets.all(18),
            alignment: Alignment.topLeft,
            child: Text("Login",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#0000FF"))),
          )
        ])],
      ),
    ));
  }
}
