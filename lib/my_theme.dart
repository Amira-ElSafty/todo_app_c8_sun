import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryLight = Color(0xff5D9CEC);
  static Color blackColor = Color(0xff363636);
  static Color whiteColor = Color(0xffffffff);
  static Color greenLight = Color(0xffDFECDB);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color greyColor = Colors.grey;
  static Color primaryDarkBackground = Color(0xff060E1E);
  static Color primaryDark = Color(0xff141922);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: greenLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: primaryLight,
      unselectedItemColor: greyColor,
      backgroundColor: Colors.transparent,
      elevation: 0
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryLight
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor
      ),
      subtitle1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: blackColor
      ),
    )
  );
  static ThemeData darkTheme = ThemeData();
}