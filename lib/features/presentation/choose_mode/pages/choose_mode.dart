import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/features/presentation/choose_mode/bloc/themebackend.dart';

import '../../../../common/basic_app_button.dart';
import '../../../../core/config/assets/appimages.dart';
import '../../../../core/config/assets/appvectors.dart';
import '../../../../core/config/theme/appcolors.dart';
import '../../registersignin/registerSignInPage.dart';

class ChooseMode extends StatefulWidget{
  @override
  State<ChooseMode> createState() {
   return ChooseModeState();
  }

}
class ChooseModeState extends State<ChooseMode>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(fit:StackFit.expand,children: [
      Container(padding:const EdgeInsets.only(left: 20,right: 20) ,decoration:BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage(appimages.choosemodebg),),) ,child:Column(children: [
        Image.asset(width:MediaQuery.of(context).size.width/2,height: MediaQuery.of(context).size.height/8,appvectors.spotifylogo),
      SizedBox(height: MediaQuery.of(context).size.height/2.10,),
       Center(child:Text('Choose Mode',style:TextStyle(color: Colors.white,fontSize:MediaQuery.of(context).size.height/35),),),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [GestureDetector(onTap:(){
          context.read<Themebackend>().updateTheme(ThemeMode.dark);
        } ,child:
        Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(appimages.blackellipse),)),padding:const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 30),child:Padding(padding:const EdgeInsets.all(5),child:SvgPicture.asset(height: 30,width: 30,appvectors.moonvector),),),),const SizedBox(width: 30,),
          GestureDetector(onTap: (){
            context.read<Themebackend>().updateTheme(ThemeMode.light);
          },child:
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(appimages.blackellipse),)),padding:const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 30),child:Padding(padding:const EdgeInsets.all(5),child: SvgPicture.asset(height: 30,width: 30,appvectors.sunvector),),),),
        ],),
        BasicAppButton('Continue',(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Registersigninpage())); } , 80),

      ],),),

    ],),);
  }

}