import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:user_frontend/student/Tabs/profile-widget/appbar_widget.dart';
import 'package:user_frontend/student/Tabs/profile-widget/button_widget.dart';
import 'package:user_frontend/student/Tabs/profile-widget/profile_widget.dart';
import 'package:user_frontend/student/Tabs/profile-widget/user.dart';
import 'package:user_frontend/student/Tabs/profile-widget/user_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final user = UserPrefences.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 48),
          Center(child: buildAbout(user)),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(user.email, style: TextStyle(color: Colors.grey))
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(user.about, style: TextStyle(fontSize: 16, height: 1.4)),
          ],
        ),
      );
}
