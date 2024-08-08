import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
import 'package:spotify/features/presentation/Pages/Home_page/widget/newsongs.dart';

class favourite_page extends StatefulWidget {
  const favourite_page({super.key});

  @override
  State<favourite_page> createState() {
    return FavouritepageState();
  }
}

class FavouritepageState extends State<favourite_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [
      Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(appimages.imgforfavpage),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(color: Colors.white, appimages.menu),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: appcolors.greycolor),
                  child:
                      Image.asset(color: Colors.white, appimages.leftbackbtn),
                ),
              ),
            ),
          ),
        ],
      ),
     const SizedBox(
        height: 20,
      ),
      artistTitle('Billie Ellish'),
      albumtrackcount('2 Album , 67 Track'),
     const SizedBox(height: 10,),
 Aboutartist('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae '),
const SizedBox(height: 10,),
 Padding(padding: EdgeInsets.only(left: 20),child:Text('Albums', style:  TextStyle(fontWeight: FontWeight.w600, fontSize: 20),)),

    ]));
  }

  Widget artistTitle(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
      ),
    );
  }

  Widget albumtrackcount(String name) {
    return  Center(
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
      ),
    );
  }
  Widget Aboutartist(String name){
    return Padding(padding:const EdgeInsets.only(left: 30,right: 30),child:  Center(
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
      ),
    ));
  }
}
