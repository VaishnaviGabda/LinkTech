import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:user_frontend/student/Tabs/about.dart';
import 'package:user_frontend/student/Tabs/home.dart';

import 'package:user_frontend/student/Tabs/profile-pages/themes.dart';
import 'package:user_frontend/student/Tabs/profile-pages/user_preferences.dart';
import 'package:user_frontend/student/Tabs/profile.dart';

import 'Tabs/mycourses.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: TabBarView(children: [
              Home(),
              MyCourses(),
              Text("wjk"),
            ]),
            appBar: AppBar(
              backgroundColor: HexColor("#0000FF"),
              title: Text('LinkTech'),
            ),
            bottomNavigationBar: menu(),
          )),
    );
  }

  Widget menu() {
    return Container(
        height: 60,
        color: HexColor("#0000FF"),
        child: TabBar(tabs: [
          Tab(
              icon: Icon(Icons.home_filled),
              child: Text("Home", style: TextStyle(fontSize: 7))),
          Tab(
              icon: Icon(Icons.school_outlined),
              child: Text("My Courses", style: TextStyle(fontSize: 7))),
          Tab(
              icon: Icon(Icons.person),
              child:
                  Text("Profile", maxLines: 1, style: TextStyle(fontSize: 7))),
        ]));
  }
}
