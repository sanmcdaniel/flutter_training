import 'dart:math';

import 'package:flutter/material.dart';

class Constant {
  // shared preferences
  static const String IS_LOGIN_PREF = "is_login";
  static const String USERNAME_PREF = "username";

  //routes
  static const String HOME_ROUTE = "/home";
  static const String LOGIN_ROUTE = "/login";
  static const String TEST_ROUTE = "/test";
  static const String DETAIL_ROUTE = "/youtube detail";
  static const String FAVORITE_ROUTE = "/favorite";

  //strings
  static const String APP_NAME = "CM APP";

  //fonts
  static const String QUICK_SAND_FONT = "Quicksand";
  static const String KANIT_FONT = "Kanit";
  static const String ROBOTO_FONT = "Roboto";

  //images
  static const String IMAGE_DIR = "assets/images";
  static const String HEADER_HOME_IMAGE = "$IMAGE_DIR/header_home.png";
  static const String HEADER_LOGIN_IMAGE = "$IMAGE_DIR/header_login.png";

  //color
  static const Color PRIMARY_COLOR = Colors.blue;
  static const Color BLUE_COLOR = Colors.blueAccent;
  static const Color GRAY_COLOR = Color(0xFF666666);
  static const Color BG_COLOR = Color(0xFFF4F6F8);
  static const Color BG_WHITE_COLOR = Color(0xFFFFFFFF);
  static const Color BG_LOAD_COLOR = Color(0xFFe1e5e7);

  //random color
  static final Random _random = Random();

  // Returns a random color.
  static Color next() {
    return Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}
