import 'package:flutter/material.dart';
import 'package:spotify/common/basic_app_button.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';

import '../../choose_mode/pages/choose_mode.dart';

class GetStarted extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GetStartedState();
  }

}
class GetStartedState extends State<GetStarted>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(body: Stack(fit:StackFit.expand,children: [
     Container(padding: const EdgeInsets.only(left: 20,right: 20) ,decoration:BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage(appimages.splashscreenBG),),) ,child: Column(children: [
       Image.asset(width:MediaQuery.of(context).size.width/2,height: MediaQuery.of(context).size.height/8,appvectors.spotifylogo),
       SizedBox(height: MediaQuery.of(context).size.height/2.10,),
       Text('Enjoy Listening To Music',style:TextStyle(color: Colors.white,fontSize:MediaQuery.of(context).size.height/35),),
      Container(padding:const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 20),child: Text('Listening Music is an Art that does not a cup of Tea of Everyone so listen music EveryTime and Enjoy Moment ',style:TextStyle(color: appcolors.greycolor,fontSize:MediaQuery.of(context).size.height/50),),),
       BasicAppButton('Get Started',(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChooseMode())); } , 80),

     ],),),

   ],),);
  }

}