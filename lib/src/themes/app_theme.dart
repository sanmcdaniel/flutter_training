import 'package:flutter/material.dart';
import 'package:training_flutter_krungsri/src/utils/constant.dart';

ThemeData appTheme({bool isIOS}) {
  return ThemeData(
    primaryColor: Constant.BLUE_COLOR,
    buttonColor: Constant.BLUE_COLOR,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      color: Colors.white,
      textTheme: TextTheme(
        title: TextStyle(
            color: Colors.black87,
            fontFamily: Constant.ROBOTO_FONT,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    splashColor: isIOS ? Colors.transparent : null,
    highlightColor: isIOS ? Colors.transparent : null,
    accentColor: Constant.BLUE_COLOR,
    hintColor: Colors.black12,
    dividerTheme:
        DividerThemeData(thickness: 0.5, color: Colors.grey[300], space: 10),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: Constant.ROBOTO_FONT,
  );
}
