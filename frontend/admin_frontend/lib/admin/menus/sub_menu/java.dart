import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Java extends StatefulWidget {
  const Java({Key? key}) : super(key: key);

  @override
  _JavaState createState() => _JavaState();
}

class _JavaState extends State<Java> {
  var btnText = "Request";
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
          child: ListTile(
              title: Row(children: [
        Text("Riddhi Pawar",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800)),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: flag ? Colors.blue: Colors.green[700]
          ),
            onPressed: () {
              setState(() {
                btnText = "Confirmed";
                flag = !flag;
              });
            },
            child: Text(btnText)),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red[700]
          ),
          onPressed: () {}, child: Icon(Icons.delete_outline)),
      ])
              // trailing: Row(
              //   children: [Icon(Icons.check),Icon(Icons.delete_outline_outlined)],
              // ),
              ));
    });
  }
}
