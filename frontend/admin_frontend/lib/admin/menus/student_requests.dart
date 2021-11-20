import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:frontend/admin/menus/sub_menu/java.dart';

class StudentRequests extends StatefulWidget {
  const StudentRequests({Key? key}) : super(key: key);

  @override
  _StudentRequestsState createState() => _StudentRequestsState();
}

class _StudentRequestsState extends State<StudentRequests> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          body: Card(
                  elevation: 4,

            child: ListView(
              children: [
                
                Container(
                  color: HexColor("#c6bfff"),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Riddhi Pawar',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Text('Java',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800)),
                          Spacer(),
                          Container(
                            width: 30,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red)),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Colors.red,
                              textColor: Colors.white,
                              child: Text("X",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.green)),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Icon(Icons.check),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
