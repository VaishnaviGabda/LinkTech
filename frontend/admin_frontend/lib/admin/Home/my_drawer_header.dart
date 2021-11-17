import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#0000FF"),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image:
                  DecorationImage(image: AssetImage('assets/images/logoo.png')),
            ),
          ),
          Text(
            "LinkTech",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "LinkTech@gmail.com",
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
