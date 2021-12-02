import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/menus/sub_menu/studentreq.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StudentRequests extends StatefulWidget {
  const StudentRequests({Key? key}) : super(key: key);

  @override
  _StudentRequestsState createState() => _StudentRequestsState();
}

class _StudentRequestsState extends State<StudentRequests> {
  // late String id;

  Future<List<Model>> getUserData() async {
    var response = await http.get(
        Uri.parse("https://linktech.herokuapp.com/student/get_all_student_requests"));
    var jsonData = json.decode(response.body);

    List<Model> users = [];

    for (var user in jsonData) {
      Model d = Model(user["_id"], user["student_name"], user["course_name"]);
      
      users.add(d);
    }
    setState(() {});

    print(users.length);

    return users;
  }

  void updateData(id) async {
    print(id);

    String uri = "https://linktech.herokuapp.com/admin/update_status$id";
    final response = await http.put(Uri.parse(uri), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 6,
          child: Scaffold(
            body: Card(
              child: FutureBuilder<List<Model>>(
                  future: getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                          padding: EdgeInsets.all(20),
                          child: Text("Wait....",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)));
                    } else if (snapshot.data!.length == 0) {
                      return Container(
                          padding: EdgeInsets.all(20),
                          child: Text("No Requests",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)));
                    } else {
                      return Container(
                        child: Scrollbar(
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: HexColor("#c6bfff"),
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.all(10),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data![index].student_name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Spacer(),
                                        Text(
                                          snapshot.data![index].course_name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 30,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.red)),
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
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.green)),
                                            onPressed: () {
                                              updateData(
                                                  snapshot.data![index].id);

                                              snapshot.data!.remove(index);
                                              setState(() {});
                                            },
                                            padding: EdgeInsets.all(10.0),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            child: Icon(Icons.check),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                );
                              }),
                        ),
                      );
                    }
                  }),
            ),
          ),
        ));
  }
}
