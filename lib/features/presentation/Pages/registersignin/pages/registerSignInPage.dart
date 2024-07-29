import 'package:flutter/material.dart';

import 'package:spotify/common/basic_app_button.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';

import '../../../../../core/config/assets/appimages.dart';
import '../../Register/pages/Register.dart';
import '../../SignIn/pages/SignIn.dart';
import '../../choose_mode/pages/choose_mode.dart';

class Registersigninpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(body:Stack(children:[Padding(padding:EdgeInsets.only(left: 20,top: 40),child:Align(child:GestureDetector(onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return ChooseMode(); })); },child:Image.asset(appimages.leftbackbtn),),alignment: Alignment.topLeft,),),Align(child: Image.asset(appimages.righttop),alignment: Alignment.topRight,),Align(child: Image.asset(appimages.rightdown),alignment: Alignment.bottomRight,),Align(child: Image.asset(appimages.billie),alignment: Alignment.bottomLeft,),Column(children: [
     SizedBox(height: MediaQuery.of(context).size.height/5,width:MediaQuery.of(context).size.width/5,),
     Image.asset(appvectors.spotifylogo),
     SizedBox(height: MediaQuery.of(context).size.height/10,width:MediaQuery.of(context).size.width/10 ,),
     Center( child:  Text('Enjoy Listening To Music',style:TextStyle(fontSize: MediaQuery.of(context).size.width/18,fontWeight: FontWeight.bold),),),
     SizedBox(height: MediaQuery.of(context).size.height/40,width:MediaQuery.of(context).size.width/40 ,),
     Center( child:  Text('Spotify is a proprietary Swedish audio\nstreaming and media services provider ',style:TextStyle(fontSize: MediaQuery.of(context).size.width/30,fontWeight: FontWeight.w500,color: appcolors.greycolor),),),
     SizedBox(height: MediaQuery.of(context).size.height/40,width:MediaQuery.of(context).size.width/40 ,),
  Padding(padding:EdgeInsets.only(left: 30,right: 30) ,child:
  Row(children: [ Expanded(child: BasicAppButton('Register',(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return Register(); })); }, 80),),SizedBox(width: 20,),Expanded(child: BasicAppButton('Sign In',(){  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return SignIn(); })); }, 80),),]),
  ),
   ],),]));
  }


}
