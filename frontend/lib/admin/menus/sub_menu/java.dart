import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Java extends StatefulWidget {
  const Java({Key? key}) : super(key: key);

  @override
  _JavaState createState() => _JavaState();
}

class _JavaState extends State<Java> {
  @override
  bool _value = false;
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: [
        Row(
          children: [
            Text('abc'),
            Spacer(),
            InkWell(
              child: _value
                  ? Icon(
                      Icons.check,
                      size: 30.0,
                      color: Colors.green[900],
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      size: 30.0,
                      color: Colors.blue,
                    ),
            )
          ],
        )
      ],
    ));
  }
}
