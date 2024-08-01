import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomToolbar(),
          space(20),
          frame(),
          imageslist(),
          space(30),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                children: [
                  playlisttext(),
                  seemoretext()
                ],
              )),
              space(30),
              SingleChildScrollView(child:Column(children: [customlist(),space(20),customlist(),space(20),customlist()],) ,),
        ],
      ),
    );
  }

  Widget CustomToolbar() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          alignment: Alignment.topCenter,
          child: Image.asset(
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height / 17,
              width: MediaQuery.of(context).size.width / 2.10,
              appvectors.spotifylogo),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 30),
          alignment: Alignment.topLeft,
          child: Image.asset(
            appimages.search,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(right: 20, top: 30),
          child: Image.asset(appimages.menu),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 94,
          ),
          child: Image.asset(appimages.frame),
        ),
        Container(
          padding: const EdgeInsets.only(left: 40, top: 25),
          child: Image.asset(fit: BoxFit.contain, appimages.billieeilish),
        )
      ],
    );
  }

  Widget space(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget frame() {
    return Container(
        padding: const EdgeInsets.only(left: 20),
        height: 50,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Text(
                'News',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Video',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Artists',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Podcast',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }

  Widget imageslist() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {},
            child:Column(mainAxisSize: MainAxisSize.max,children: [ Stack(
              children: [
                Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(appimages.billiesmallimage),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(appimages.greybg)),
                    ),
                    child: Center(child: Image.asset(appimages.playbtn)),
                  ),
                ),],),
                ],),),
          const SizedBox(
            width: 20,
          ),
       GestureDetector(
            onTap: () {},
            child:Column(children: [ Stack(
              children: [
                Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(appimages.billiesmallimage),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(appimages.greybg)),
                    ),
                    child: Center(child: Image.asset(appimages.playbtn)),
                  ),
                )
              ],
            ),])
          ),
          const SizedBox(
            width: 20,
          ),
        GestureDetector(
            onTap: () {},
            child:Column(children: [ Stack(
              children: [
                Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(appimages.billiesmallimage),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(appimages.greybg)),
                    ),
                    child: Center(child: Image.asset(appimages.playbtn)),
                  ),
                )
              ],
            ),])
          ),
        ],
      ),
    );
  }

  Widget Textheading(String text, double height, FontWeight fontweight) {
    return Text(
      text,
      style: TextStyle(
        fontSize: height,
        fontWeight: fontweight,
      ),
    );
  }

  Widget playlisttext() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Textheading('Playlist', 25, FontWeight.w700),
    );
  }

  Widget seemoretext() {
    return Align(
      alignment: Alignment.centerRight,
      child: Textheading('See More', 20, FontWeight.w300),
    );
  }

  Widget customlist(){
    return Row(children: [SizedBox(width: 20,),Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(appimages.greybg)),
                    ),
                    child: Center(child: Image.asset(appimages.playbtn)),
                  ),SizedBox(width: 20,),Column(children: [Textheading('As it was', 18, FontWeight.bold),Textheading('Harry styles', 15, FontWeight.w400)],) ,SizedBox(width:MediaQuery.of(context).size.width/5),Textheading('5:22', 20, FontWeight.w300),SizedBox(width: MediaQuery.of(context).size.width/7),Align(alignment: Alignment.centerRight,child:SvgPicture.asset(appvectors.heart),)],);
  }
}

