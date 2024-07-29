import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';


import '../../../../../common/basic_app_button.dart';
import '../../registersignin/pages/registerSignInPage.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => RegisterState();
}

class RegisterState extends State<SignIn> {
final _email=TextEditingController();
final _password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 55.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child:GestureDetector(onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return Registersigninpage(); })); },child:Image.asset(appimages.leftbackbtn),
              ),
            ),
          ),),



      Padding(padding: EdgeInsets.only(top: 30),child:  Align(
          alignment: Alignment.topCenter,
          child:  Image.asset(appvectors.spotifylogo),
        ),),


     Expanded(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/5,),
              Center( child:  Text('Sign In',style:TextStyle(fontSize: MediaQuery.of(context).size.width/10,fontWeight: FontWeight.bold,color: Colors.black),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children:[ Center( child:  Text('If You Need Any Support',style:TextStyle(fontSize: MediaQuery.of(context).size.width/30,fontWeight: FontWeight.w500,color: Colors.black),),),TextButton(onPressed: (){}, child: Text('Click Here',style:TextStyle(fontSize: MediaQuery.of(context).size.width/30,fontWeight: FontWeight.w500,color: appcolors.Primarycolor)) ) ],),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(height: MediaQuery.of(context).size.height/10,width:MediaQuery.of(context).size.width/1.20 ,decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.fill,image:AssetImage(appimages.rectangle)),),child:Center(child: TextFormField(controller:_email ,decoration: const InputDecoration(contentPadding: EdgeInsets.only(left: 20),hintText:'Enter Username or Email', border: InputBorder.none, ),),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Container(height: MediaQuery.of(context).size.height/10,width:MediaQuery.of(context).size.width/1.20 ,decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.fill,image:AssetImage(appimages.rectangle)),),child:Center(child: TextFormField(controller: _password ,decoration: const InputDecoration(contentPadding: EdgeInsets.only(left: 20),hintText:'Password', border: InputBorder.none, ),),),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              Container(width:MediaQuery.of(context).size.width/1.20,padding: const EdgeInsets.only(left:10 ) ,alignment: Alignment.centerLeft,child:GestureDetector(onTap: (){},child: Text('Recovery Password',style:TextStyle(fontSize: MediaQuery.of(context).size.width/25,fontWeight: FontWeight.w700,color: Colors.black)), ),),
              SizedBox(height: MediaQuery.of(context).size.height/40,),
              BasicAppButton('Sign In',() async { 
                // final AuthUseCase _authUseCase = AuthUseCase();
                // final result = await _authUseCase.signIn(_email.text.toString(), _password.text.toString());


                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return SignIn(); })); }, 80),




            ],
          ),
        ),



      ],
    ));
  }
}
