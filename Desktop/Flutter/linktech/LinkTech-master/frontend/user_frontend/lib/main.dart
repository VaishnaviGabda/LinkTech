import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:user_frontend/student/Tabs/login.dart';
import 'package:user_frontend/student/Tabs/profile-pages/user_preferences.dart';
import 'package:user_frontend/student/dashboard.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefences.init();

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
      theme: ThemeData(
        primaryColor: HexColor("#0000FF"),
      ),
      home: AnimatedSplashScreen(
          splash: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logoo.png', width: 55),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "LinkTech",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: HexColor("#0000FF"),
          nextScreen: Dashboard()),
    );
  }
}
