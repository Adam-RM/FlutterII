import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: appTextColor),
    bodyText2: TextStyle(color: appTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: appColor, fontSize: 20),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
