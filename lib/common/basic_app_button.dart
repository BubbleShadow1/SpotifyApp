import 'package:flutter/material.dart';
import 'package:spotify/core/config/theme/appcolors.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  final double ? height;
  const BasicAppButton(this.title,this.onpressed,this.height,{super.key});

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(onPressed: onpressed, child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),style: ElevatedButton.styleFrom(backgroundColor:appcolors.Primarycolor,foregroundColor: appcolors.secondarycolor ,minimumSize: Size.fromHeight(height ?? 80),),);
  }

}