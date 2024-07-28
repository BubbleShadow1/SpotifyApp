import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';

class Musicpage extends StatefulWidget{
  @override
  State<Musicpage> createState() {
    return MusicpageState();
  }

}
class MusicpageState extends State<Musicpage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:Colors.transparent,actions: [GestureDetector(onTap: (){},child:Image.asset(appimages.menu) ,)],leading: IconButton(onPressed: (){}, icon: Image(image:AssetImage(appimages.leftbackbtn)),),elevation:0 ,title:Center(child:Text('Now playing',style:TextStyle(fontWeight:FontWeight.w700 ,fontSize: 20),)),),
      body:Column(children: [Image.asset(appimages.playerimage,fit:BoxFit.cover,height: MediaQuery.of(context).size.height/1.90,width: MediaQuery.of(context).size.height/1.90,),Row(mainAxisSize:MainAxisSize.max,children:[Padding(padding:EdgeInsets.only(left:30) ,child:Align(alignment: Alignment.topLeft,child:Text('Bad Guy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),) ),Align(alignment: Alignment.centerRight,child:SvgPicture.asset(appvectors.heart)) ]), Padding(padding:EdgeInsets.only(left:30) ,child:Align(alignment: Alignment.topLeft,child:Text('Billie Eilish',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),) )]));
  }

}