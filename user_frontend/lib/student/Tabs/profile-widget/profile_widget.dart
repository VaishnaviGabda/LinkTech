import 'package:hexcolor/hexcolor.dart';

//import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget(
      {Key? key, required this.imagePath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = HexColor("#0000FF");

    return Center(
        child: Stack(children: [
      buildImage(),
      Positioned(bottom: 0, right: 4, child: buildEditIcon(color)),
    ]));
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);
    return ClipOval(
        child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: image,
              fit: BoxFit.cover,
              width: 128,
              height: 128,
              child: InkWell(
                onTap: onClicked,
              ),
            )));
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: color,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        child: child,
      ));
}
