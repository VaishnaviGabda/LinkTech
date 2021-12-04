import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/admin/menus/sub_menu/studentreq.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class EnrolledStudents extends StatefulWidget {
  const EnrolledStudents({Key? key}) : super(key: key);

  @override
  _EnrolledStudentsState createState() => _EnrolledStudentsState();
}

class _EnrolledStudentsState extends State<EnrolledStudents> {
  // late String id;

  Future<List<Model>> getUserData() async {
    var response = await http.get(
        Uri.parse("https://linktech.herokuapp.com/student/get_confirmed_students"));
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


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:frontend/admin/menus/sub_menu/studentreq.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// class EnrolledStudents extends StatefulWidget {
//   const EnrolledStudents({Key? key}) : super(key: key);

//   @override
//   _EnrolledStudentsState createState() => _EnrolledStudentsState();
// }

// class _EnrolledStudentsState extends State<EnrolledStudents> {
//   List<Map<String, dynamic>> _foundUsers = [];
//   List<Map<String, dynamic>> _allUsers = [];
//   @override
//   initState() {
//     // at the beginning, all users are shown
//     _foundUsers = _allUsers;
//     super.initState();
//   }

//   // This function is called whenever the text field changes
//   void _runFilter(String enteredKeyword) {
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       // if the search field is empty or only contains white-space, we'll display all users
//       results = _allUsers;
//     } else {
//       results = _allUsers
//           .where((user) =>
//               user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();

//       setState(() {
//         _foundUsers = results;
//       });
//     }
//     Future<List<Model>> getUserData() async {
//       var response = await http.get(
//           Uri.parse("http://localhost:3000/student/get_confirmed_students"));
//       var jsonData = json.decode(response.body);
//       _allUsers.add(jsonData);

//       List<Model> users = [];

//       for (var user in jsonData) {
//         Model d = Model(user["_id"], user["student_name"], user["course_name"]);
//         users.add(d);
//       }
//       setState(() {});

//       print(users.length);

//       return users;
//     }

//     Widget build(BuildContext context) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: DefaultTabController(
//           length: 6,
//           child: Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextField(
//                     onChanged: (value) => _runFilter(value),
//                     decoration: const InputDecoration(
//                         labelText: 'Search', suffixIcon: Icon(Icons.search)),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: _foundUsers.isNotEmpty
//                         ? ListView.builder(
//                             itemCount: _foundUsers.length,
//                             itemBuilder: (context, index) => Card(
//                               key: ValueKey(_foundUsers[index]["id"]),
//                               color: Colors.amberAccent,
//                               elevation: 4,
//                               margin: const EdgeInsets.symmetric(vertical: 10),
//                               child: ListTile(
//                                 leading: Text(
//                                   _foundUsers[index]["id"].toString(),
//                                   style: const TextStyle(fontSize: 24),
//                                 ),
//                                 title: Text(_foundUsers[index]['name']),
//                                 subtitle: Text(
//                                     '${_foundUsers[index]["age"].toString()} years old'),
//                               ),
//                             ),
//                           )
//                         : const Text(
//                             'No results found',
//                             style: TextStyle(fontSize: 24),
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
