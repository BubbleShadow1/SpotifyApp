import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/features/presentation/registersignin/presentation/pages/registerSignInPage.dart';

import '../../../../common/basic_app_button.dart';
import '../../../../core/config/assets/appimages.dart';
import '../../../../core/config/assets/appvectors.dart';
import '../../../../core/config/theme/appcolors.dart';
import '../../SignIn/presentation/pages/SignIn.dart';

class Register extends StatefulWidget{
  @override
  State<Register> createState() {
    return RegisterState();
  }

}
class RegisterState extends State<Register>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 55.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child:GestureDetector(onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return Registersigninpage(); })); },child:  Image.asset(appimages.leftbackbtn),
            ),
          ),
        ),),



        Padding(padding: EdgeInsets.only(top: 30),child:  Align(
          alignment: Alignment.topCenter,
          child:Image.asset(appvectors.spotifylogo),
        ),),


        Expanded(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/6,),
              Center( child:  Text('Register',style:TextStyle(fontSize: MediaQuery.of(context).size.width/10,fontWeight: FontWeight.bold,color: Colors.black),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children:[ Center( child:  Text('If You Need Any Support',style:TextStyle(fontSize: MediaQuery.of(context).size.width/30,fontWeight: FontWeight.w500,color: Colors.black),),),TextButton(onPressed: (){}, child: Text('Click Here',style:TextStyle(fontSize: MediaQuery.of(context).size.width/30,fontWeight: FontWeight.w500,color: appcolors.Primarycolor)) ) ],),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(height: MediaQuery.of(context).size.height/10,width:MediaQuery.of(context).size.width/1.20 ,decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.fill,image:AssetImage(appimages.rectangle)),),child:Center(child: TextFormField(decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 20),hintText:'Enter Username or Email', border: InputBorder.none, ),),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Container(height: MediaQuery.of(context).size.height/10,width:MediaQuery.of(context).size.width/1.20 ,decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.fill,image:AssetImage(appimages.rectangle)),),child:Center(child: TextFormField(decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 20),hintText:'Enter Email', border: InputBorder.none, ),),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Container(height: MediaQuery.of(context).size.height/10,width:MediaQuery.of(context).size.width/1.20 ,decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.fill,image:AssetImage(appimages.rectangle)),),child:Center(child: TextFormField(decoration: InputDecoration(contentPadding: EdgeInsets.only(left: 20),hintText:'Password', border: InputBorder.none, ),),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              BasicAppButton('Create Account',(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return Register(); })); }, 80),




            ],
          ),
        ),



      ],
    ));
  }

}