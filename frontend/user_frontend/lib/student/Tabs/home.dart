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
  late String passname, id;

  Future<List<Model>> getUserData() async {
    var response =
        await http.get(Uri.parse("https://linktech.herokuapp.com/admin/get_courses"));
    var jsonData = json.decode(response.body);

    List<Model> users = [];

    for (var user in jsonData) {
      Model d = Model(user["_id"], user["name"], user["duration"], user["fees"],
          user["seats"]);
      users.add(d);
      //passname = user["name"];
      id = user["_id"];
    }

    setState(() {});

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
                          return Scrollbar(
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)
                                    ),
                                    margin: EdgeInsets.all(5),
                                    child: ListTile(
                                      
                                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                    
                                        title: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                     
                                      color: Colors.grey[300],
                                     
                                    ),
                              
                                              padding: EdgeInsets.all(10),
                                              
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          snapshot
                                                              .data![index]
                                                              .name.toUpperCase(),
                                                          textAlign:
                                                              TextAlign
                                                                  .left,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800)),
                                                    ],
                                                  ),
                                                   Spacer(),
                                                
                                                  IconButton(
                                                    icon: Icon(Icons.arrow_forward),    
                                                      onPressed: () {
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) => StudentForm(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id,
                                                                passname: snapshot
                                                                    .data![index]
                                                                    .name)));
                                                      })
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.hourglass_empty,color: Colors.grey,size: 18,),
                                                SizedBox(width: 10,),
                                                Text("DURATION",
                                                style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w800),
                                                    textAlign:
                                                        TextAlign.left),
                                                Spacer(),
                                                Text(
                                                    snapshot.data![index]
                                                        .duration,
                                                    textAlign:
                                                        TextAlign.left,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w800)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.money,color: Colors.grey,size: 18,),
                                                SizedBox(width: 10,),
                                                Text("FEES",
                                                style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w800),
                                                    textAlign:
                                                        TextAlign.left),
                                                Spacer(),
                                                Text(
                                                    snapshot.data![index]
                                                        .fees,
                                                    textAlign:
                                                        TextAlign.left,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w800)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.school_outlined,color: Colors.grey,size: 18,),
                                                SizedBox(width: 10,),
                                                Text("SEATS",
                                                style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w800),
                                                    textAlign:
                                                        TextAlign.left),
                                                Spacer(),
                                                Text(
                                                    snapshot.data![index]
                                                        .seats,
                                                    textAlign:
                                                        TextAlign.left,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight
                                                                .w800)),
                                              ],
                                            ),
                                          ],
                                        )),
                                  );
                                }),
                          );
                        }
                      })))),
    );
  }
}
