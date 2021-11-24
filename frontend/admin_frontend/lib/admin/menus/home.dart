import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/menus/data.dart';
import 'package:frontend/admin/menus/sub_menu/course.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Model>> getUserData() async {
    var response =
        await http.get(Uri.parse("http://localhost:3000/admin/get_courses"));
    var jsonData = json.decode(response.body);

    List<Model> users = [];

    for (var user in jsonData) {
      Model d =
          Model(user["name"], user["duration"], user["fees"], user["seats"]);
      users.add(d);
    }

    print(users.length);
    return users;
  }

  Future<Course> deleteCourse(String cname) async {
    String uri = "http://localhost:3000/admin/delete_course";
    final response = await http.post(Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "name": cname,
        }));
    setState(() {});
    return courseFromJson(response.body);
  }

  

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController();
    return Center(
        child: Container(
            child: Card(
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
                                child: Card(
                                  elevation: 4,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                      tileColor: Colors.grey[200],
                                      title: Row(
                                        children: [
                                          Text(snapshot.data![index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700)),
                                          Spacer(),
                                          SizedBox(width: 20),
                                          IconButton(
                                              icon: new Icon(Icons.delete),
                                              color: Colors.red,
                                              onPressed: () {
                                                deleteCourse(
                                                    snapshot.data![index].name);
                                              }),
                                        ],
                                      )),
                                ),
                              );
                            });
                      }
                    }))));
  }
}
