import 'package:flutter/material.dart';
import 'package:linkfood/login.dart';
import 'package:linkfood/register.dart';
// import 'package:splashscreen/splashscreen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: HexColor("#0002FF"),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Register(),
    );
  }
}

// class Splash extends StatelessWidget {
//   const Splash({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: SplashScreen(
//           loaderColor: Colors.white,
//           backgroundColor: HexColor("#0002FF"),
//           seconds: 20,
//           navigateAfterSeconds: Register(),
//           image: Image.asset(
//             "images/logo1.JPG",
//             height: 380,
//             width: 350,
//           ),
//           title: Text("LinkFood",
//               style: TextStyle(color: Colors.white, fontSize: 30)),
//         ),
//       ),
//     );
//   }
// }
