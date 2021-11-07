import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:user_frontend/student/Tabs/about.dart';
import 'package:user_frontend/student/Tabs/home.dart';
import 'package:user_frontend/student/Tabs/mycourses.dart';
import 'package:user_frontend/student/Tabs/profile-pages/themes.dart';
import 'package:user_frontend/student/Tabs/profile-pages/user_preferences.dart';
import 'package:user_frontend/student/Tabs/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget build(BuildContext context) {
    final user = UserPrefences.myUser;
    return ThemeProvider(
        initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
        child: Builder(
            builder: (context) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeProvider.of(context),
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
                            Tab(text: "About"),
                            Tab(text: "Profile"),
                          ],
                        ),
                        title: Row(
                          children: [
                            Image.asset('assets/images/logoo.png', width: 19),
                            SizedBox(height: 9),
                            const Text(
                              'LinkTech',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      body: const TabBarView(
                        children: [Home(), About(), Profile()],
                      ),
                    ),
                  ),
                )));
  }
}
