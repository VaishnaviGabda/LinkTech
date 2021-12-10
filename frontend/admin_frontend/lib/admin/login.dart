import 'package:flutter/material.dart';
import 'package:frontend/admin/Home/dashboard.dart';
import 'package:frontend/admin/menus/data.dart';
import 'package:frontend/admin/register.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'menus/user.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}


class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late  bool _passwordVisible = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  Future userLogin(String email, String password) async {
    final api_url = "http://localhost:3000/adminlogin/signin";
    var response = await http.post(Uri.parse(api_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": email, "password": password}));
    // print(response.body);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _passwordVisible = false;

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#0000FF"),
          title: Text('LinkTech'),
        ),
        body: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign In",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#0000FF"))),
                  Container(
                    margin: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        TextField(
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
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: TextFormField(
                            controller: password,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
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
                              final form = _formKey.currentState;
                              if (form != null) {
                                if (form.validate()) {
                                  userLogin(email.text, password.text);
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                }
                              } else {
                                print('hello');
                              }
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(18),
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Register()));
                              },
                              child: Text("Create Account",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#0000FF"))),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
  
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   var _formKey = GlobalKey<FormState>();

//   // Future<User> checkData(String email, String password) async {
//   //   String uri = "http://localhost:3000/adminlogin/signin";
//   //   final response = await http.post(Uri.parse(uri),
//   //       headers: <String, String>{
//   //         'Content-Type': 'application/json; charset=UTF-8',
//   //       },
//   //       body: jsonEncode({"email": email, "password": password}));
//   //   // return userFromJson(response.body.toString());
//   //   return json.decode(response.body);
//   // }

//   Future userLogin(String email, String password) async {
//     final api_url = "http://localhost:3000/adminlogin/signin";
//     var response = await http.post(Uri.parse(api_url),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode({"email": email, "password": password}));
//     // print(response.body);
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => Dashboard()));
//   }

//   bool _isHidden = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#0000FF"),
//         title: Text('LinkTech'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         alignment: Alignment.center,
//         child: ListView(
//           padding: EdgeInsets.only(top: 90),
//           children: [
//             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Container(
//                 margin: EdgeInsets.all(18),
//                 alignment: Alignment.topLeft,
//                 child: Text("Sign In",
//                     style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w400,
//                         color: HexColor("#0000FF"))),
//               ),
//               Container(
//                 margin: EdgeInsets.all(12),
//                 child: TextField(
//                   controller: email,
//                   decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10))),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10))),
//                       hintText: " Enter email address",
//                       hintStyle: TextStyle(fontSize: 14)),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(12),
//                 child: TextField(
//                   controller: password,
//                   //obscureText: _isHidden,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     hintText: " Enter password",
//                     hintStyle: TextStyle(fontSize: 14),
//                     // suffix: InkWell(
//                     //   onTap: _togglePasswordView,
//                     //   child: Icon(
//                     //     _isHidden
//                     //         ? Icons.visibility_off_outlined
//                     //         : Icons.remove_red_eye_outlined,
//                     //   ),
//                     // ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(18),
//                 alignment: Alignment.topLeft,
//                 child: RaisedButton(
//                   child: Container(
//                       padding: EdgeInsets.all(10),
//                       child: Text("Sign In",
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w400,
//                           ))),
//                   color: HexColor("#0000FF"),
//                   onPressed: () {
//                     final form = _formKey.currentState;
//                     if (form != null) {
//                       if (form.validate()) {
//                         userLogin(email.text, password.text);
//                       } else {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Register()));
//                       }
//                     } else {
//                       print('hello');
//                     }
//                   },
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(18),
//                 alignment: Alignment.topLeft,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => Register()));
//                   },
//                   child: Text("Create Account",
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: HexColor("#0000FF"))),
//                 ),
//               ),
//             ]
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
