import 'package:flutter/material.dart';
import 'appcolors.dart';

class Themesname {
  static ThemeData lightTheme=ThemeData(fontFamily: 'Satoshi',primarySwatch: Colors.green,primaryColor: appcolors.Primarycolor,brightness: Brightness.light,scaffoldBackgroundColor: appcolors.lightbackground,textTheme: TextTheme(bodyLarge: TextStyle(color: appcolors.secondarycolor)));
  static ThemeData darkTheme=ThemeData(fontFamily: 'Satoshi',primarySwatch: Colors.green,primaryColor: appcolors.Primarycolor,brightness: Brightness.dark,scaffoldBackgroundColor: appcolors.darkbackground,textTheme: TextTheme(bodyLarge: TextStyle(color: appcolors.secondarycolor)));
}