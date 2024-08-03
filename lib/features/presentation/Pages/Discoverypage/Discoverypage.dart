import 'package:flutter/material.dart';

class Discoverypage extends StatefulWidget {
  const Discoverypage({super.key});
  @override
  State<StatefulWidget> createState() {
    return DiscoverypageState();
  }
}

class DiscoverypageState extends State<Discoverypage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('This is Discovery page'));
  }
}
