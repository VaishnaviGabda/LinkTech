import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_frontend/student/Tabs/student-form.dart';
import 'dart:async';
import 'dart:convert';

import 'package:user_frontend/student/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String passname,id;

  Future<List<Model>> getUserData() async {
    var response =
        await http.get(Uri.parse("http://localhost:3000/admin/get_courses"));
    var jsonData = json.decode(response.body);

    List<Model> users = [];

    for (var user in jsonData) {
      Model d = Model(user["_id"], user["name"], user["duration"], user["fees"],
          user["seats"]);
      users.add(d);
      passname = user["name"];
      id = user["_id"];
    }

    print(users.length);

    return users;
  }

  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return Center(
      child: Container(
          child: Card(
              child: new InkWell(
                  child: FutureBuilder<List<Model>>(
                      future: getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                              padding: EdgeInsets.all(20),
                              child: Text("Wait....",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)));
                        } else if (snapshot.data!.length == 0) {
                          return Container(
                              padding: EdgeInsets.all(20),
                              child: Text("No Courses",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)));
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: ListTile(
                                      tileColor: Colors.grey[200],
                                      title: Row(
                                        children: [
                                          SizedBox(
                                            height: 120,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Course",
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) => StudentForm(
                                                                    id: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id,
                                                                    passname: snapshot
                                                                        .data![
                                                                            index]
                                                                        .name)));
                                                      },
                                                      child: Text(
                                                          snapshot.data![index]
                                                              .name,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Duration",
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                        snapshot.data![index]
                                                            .duration,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Fees",
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                        snapshot
                                                            .data![index].fees,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("Seats",
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                        snapshot
                                                            .data![index].seats,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              });
                        }
                      })))),
    );
  }
}
