import 'package:training_flutter_krungsri/src/utils/constant.dart';
import 'package:flutter/material.dart';

ThemeData appDarkTheme({bool isIOS}) {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Constant.BLUE_COLOR,
    buttonColor: Constant.BLUE_COLOR,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        title: TextStyle(
          color: Constant.BLUE_COLOR,
          fontFamily: Constant.ROBOTO_FONT,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      iconTheme: IconThemeData(
        color: Constant.BLUE_COLOR,
      ),
    ),
    splashColor: isIOS ? Colors.transparent : null,
    highlightColor: isIOS ? Colors.transparent : null,
    accentColor: Constant.BLUE_COLOR,
    hintColor: Colors.white,
    dividerTheme:
        DividerThemeData(thickness: 0.5, color: Colors.black54, space: 10),
    fontFamily: Constant.ROBOTO_FONT,
  );
}
