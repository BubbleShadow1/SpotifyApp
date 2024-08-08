import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/constant/image_url.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/presentation/Pages/Home_page/widget/play_list.dart';
import 'package:spotify/features/presentation/Pages/Music_Page/pages/musicpage.dart';
import 'package:spotify/features/presentation/cubit/playlist/playlist_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      ProfileUpperPart(),
      ProfileLowerPart()
    ]));
  }

  Widget customToolbar() {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).brightness == Brightness.light
                            ? appcolors.greycolor
                            : appcolors.secondarycolor),
                    child: Image.asset(
                        color: Theme.of(context).brightness == Brightness.light
                            ? const Color.fromARGB(255, 0, 0, 0)
                            : const Color.fromARGB(255, 0, 0, 0),
                        appimages.leftbackbtn),
                  )),
            )),
        const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('Profile',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            )),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Image.asset(appimages.menu),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(appimages.ellipseprofile),
        ),
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 13),
            child: belowtoolbar('username', 'useremail@gmail.com')),
      ],
    );
  }

  Widget belowtoolbar(String usernam, String useremail) {
    return Column(
      children: [
        Center(
          child: Image.asset(appimages.profilepic),
        ),
        Center(
            child: Text(
          useremail,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        )),
        Center(
          child: Text(
            usernam,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }

  Widget followcount() {
    return Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            following('232'),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            ),
            followers('243')
          ],
        ));
  }

  Widget following(String followingcount) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            followingcount,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Following',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget followers(String followerscount) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            followerscount,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Followers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget ProfileUpperPart() {
    return Material(
      elevation: 20,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70)),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70)),
          color: Color.fromARGB(255, 204, 204, 204),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            customToolbar(),
            followcount()
          ],
        ),
      ),
    );
  }

  Widget ProfileLowerPart() {
    return Expanded(child: Column(children: [
      SizedBox(height: 30,),
      Text('PUBLIC PLAYLISTS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
      PlayList(),


    ],));
  }

 
}
