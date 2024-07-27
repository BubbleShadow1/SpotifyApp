import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
import 'package:spotify/intro/presentation/pages/get_started.dart';

class Splash extends StatefulWidget{
  @override
  Splash({super.key});
  @override
  State<Splash> createState() {
   return splashState();
  }
}

class splashState extends State<Splash>{
  @override
  @override
  void initState() {
    super.initState();
    delay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Image.asset(appvectors.spotifylogo),),);
  }



  Future<void> delay() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return GetStarted();
    }));
  }
  }















