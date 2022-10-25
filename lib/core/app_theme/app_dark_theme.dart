import 'package:bmi_app/core/app_sizes/app_sizes.dart';
import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    canvasColor: canvasColor,
    appBarTheme:
        AppBarTheme(backgroundColor: panelBackgroundColor, elevation: 0),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(textButtonBackgroundColor),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: fabBackgroundColor,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static Color canvasColor = const Color(0xff0A0C21);
  static Color panelBackgroundColor = const Color(0xff111328);
  static Color fabBackgroundColor = const Color(0xff1C1F32);
  static Color textButtonBackgroundColor = const Color(0xffEB1555);
  static Color unselectedIconColor = const Color(0xff8B8D9A);
  static Color selectedIconColor = Colors.white;
}

class AppTextStyle {
  BuildContext context;
  AppTextStyle(this.context);

  TextStyle get subTitleText => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26 * AppSizes(context).rotationDeviceWidth / 480,
        color: Colors.white,
      );
  TextStyle get headLine1 => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 44 * AppSizes(context).rotationDeviceWidth / 480,
        color: Colors.white,
      );
}
