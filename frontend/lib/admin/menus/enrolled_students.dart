import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EnrolledStudents extends StatefulWidget {
  const EnrolledStudents({Key? key}) : super(key: key);

  @override
  _EnrolledStudentsState createState() => _EnrolledStudentsState();
}

class _EnrolledStudentsState extends State<EnrolledStudents> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: HexColor("#0000FF"),
                child: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Java"),
                    Tab(text: "C"),
                    Tab(text: "CPP"),
                    Tab(text: "Data Structures"),
                    Tab(text: "DBMS"),
                    Tab(text: "CPP"),
                  ],
                ),
              ),
              Container(
                child: TabBarView(
                  children: [
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                    Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
