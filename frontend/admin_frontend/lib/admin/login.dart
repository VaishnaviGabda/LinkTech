import 'package:flutter/material.dart';
import 'package:frontend/admin/Home/dashboard.dart';
import 'package:frontend/admin/register.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#0000FF"),
        title: Text('LinkTech'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.only(top: 90),
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.all(18),
                alignment: Alignment.topLeft,
                child: Text("Sign In",
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                margin: EdgeInsets.all(18),
                alignment: Alignment.topLeft,
                child: RaisedButton(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("Sign In",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ))),
                    color: HexColor("#0000FF"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.all(18),
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text("Create Account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#0000FF"))),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
