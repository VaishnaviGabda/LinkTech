import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:user_frontend/student/Tabs/about.dart';
import 'package:user_frontend/student/Tabs/home.dart';
import 'package:user_frontend/student/Tabs/profile.dart';

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
          appBar: AppBar(
            backgroundColor: HexColor("#0000FF"),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                Tab(text: "Home"),
                Tab(text: "Profile"),
                Tab(text: "About"),
              ],
            ),
            title: Row(
              children: [
                Image.asset(
                  'assets/images/logoo.png',
                  width: 22,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'LinkTech',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [Home(), Profile(), About()],
          ),
        ),
      ),
    );
  }
}
