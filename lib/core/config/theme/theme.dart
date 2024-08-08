import 'package:flutter/material.dart';
import 'appcolors.dart';

class Themesname {
  static ThemeData lightTheme=ThemeData(fontFamily: 'Satoshi',primarySwatch: Colors.green,primaryColor: appcolors.Primarycolor,brightness: Brightness.light,scaffoldBackgroundColor: appcolors.lightbackground,textTheme:const TextTheme(bodyLarge: TextStyle(color: appcolors.darkbackground)));



  static ThemeData darkTheme=ThemeData(fontFamily: 'Satoshi',primarySwatch: Colors.green,primaryColor: appcolors.Primarycolor,brightness: Brightness.dark,scaffoldBackgroundColor: appcolors.darkbackground,textTheme:const TextTheme(bodyMedium:TextStyle(color: appcolors.secondarycolor),bodySmall: TextStyle(color: appcolors.secondarycolor) ,bodyLarge: TextStyle(color: appcolors.secondarycolor)));
}