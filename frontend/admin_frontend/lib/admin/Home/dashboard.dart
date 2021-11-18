import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/login.dart';
import 'package:frontend/admin/menus/enrolled_students.dart';
import 'package:frontend/admin/menus/home.dart';
import 'package:frontend/admin/menus/profile.dart';
import 'package:frontend/admin/menus/student_requests.dart';
import 'package:frontend/admin/menus/upload_new_course.dart';
import 'package:hexcolor/hexcolor.dart';

import 'my_drawer_header.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var currentPage = DrawerSections.Home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Login) {
      container = Profile();
    } else if (currentPage == DrawerSections.Home) {
      container = Home();
    } else if (currentPage == DrawerSections.Courses) {
      container = UploadNewCourse();
    } else if (currentPage == DrawerSections.Requests) {
      container = StudentRequests();
    } else if (currentPage == DrawerSections.Students) {
      container = EnrolledStudents();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#0000FF"),
        title: Text('LinkTech'),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [MyHeaderDrawer(), MyDrawerList()],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Profile", Icons.person,
              currentPage == DrawerSections.Login ? true : false),
          menuItem(2, "Home", Icons.home,
              currentPage == DrawerSections.Home ? true : false),
          menuItem(3, "Courses", Icons.book_outlined,
              currentPage == DrawerSections.Courses ? true : false),
          menuItem(4, "Requests", Icons.person_add_alt_outlined,
              currentPage == DrawerSections.Requests ? true : false),
          menuItem(5, "Students", Icons.school_outlined,
              currentPage == DrawerSections.Students ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.Login;
            } else if (id == 2) {
              currentPage = DrawerSections.Home;
            } else if (id == 3) {
              currentPage = DrawerSections.Courses;
            } else if (id == 4) {
              currentPage = DrawerSections.Requests;
            } else if (id == 5) {
              currentPage = DrawerSections.Students;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { Login, Home, Courses, Requests, Students }
