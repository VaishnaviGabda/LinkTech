import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_frontend/student/Tabs/profile-pages/themes.dart';
import 'package:user_frontend/student/Tabs/profile-pages/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final user = UserPrefences.getUser();
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context)!;
            switcher.changeTheme(theme: theme);

            //final newUser = user.copy(isDarkMode: !isDarkMode);
            //UserPrefences.setUser(newUser);
          },
        ),
      ),
    ],
  );
}
