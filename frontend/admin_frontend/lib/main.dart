import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cache_manager/core/cache_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/login.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future initiateCache() async {
    CacheManagerUtils.conditionalCache(
        key: "cache",
        valueType: ValueType.StringValue,
        actionIfNull: () {},
        actionIfNotNull: () {});
  }

  void initState() {
    Timer(Duration(seconds: 3), initiateCache);
    initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: HexColor("#0000FF"),
      ),
      home: SignIn(),
      // home: AnimatedSplashScreen(
      //     splash: Center(
      //       child: Column(
      //         // mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Image.asset('assets/images/logoo.png', width: 55),
      //           SizedBox(
      //             height: 5,
      //           ),
      //           Text(
      //             "LinkTech",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 17,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ),
      //     ),
      //     duration: 3000,
      //     splashTransition: SplashTransition.fadeTransition,
      //     backgroundColor: HexColor("#0000FF"),
      //     nextScreen:),
    );
  }
}
