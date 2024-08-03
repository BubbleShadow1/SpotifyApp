import 'package:flutter/material.dart';

class favourite_page extends StatefulWidget {
  const favourite_page({super.key});

  @override
  State<favourite_page> createState() {
    return FavouritepageState();
  }
}

class FavouritepageState extends State<favourite_page>{
      @override
      Widget build(BuildContext context) {
return const Scaffold(
      body: Text('This is Favourite page .')
    );
      }
}
