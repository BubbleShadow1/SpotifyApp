import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
import 'package:spotify/features/presentation/Pages/Discoverypage/Discoverypage.dart';
import 'package:spotify/features/presentation/Pages/Favouritepage/Favouritepage.dart';
import 'package:spotify/features/presentation/Pages/Home_page/widget/newsongs.dart';
import 'package:spotify/features/presentation/Pages/Home_page/widget/play_list.dart';
import 'package:spotify/features/presentation/Pages/profile_page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Widget> widgetlist = [
    const HomePageBody(),
    const Discoverypage(),
   const favourite_page(),
    const ProfilePage()
  ];

  int selectedindex = 0;

  void ontapindex(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetlist[selectedindex],
        bottomNavigationBar: bottomnavigationbarwidget());
  }

  Widget bottomnavigationbarwidget() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: SvgPicture.asset(appvectors.btnv1),
        ),
        BottomNavigationBarItem(
            label: 'Discovery', icon: SvgPicture.asset(appvectors.btnv2)),
        BottomNavigationBarItem(
            label: 'Favourite', icon: SvgPicture.asset(appvectors.btnv3)),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: SvgPicture.asset(appvectors.btnv4),
        ),
      ],
      onTap: ontapindex,
      currentIndex: selectedindex,
      selectedItemColor: appcolors.Primarycolor,
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() {
    return HomePageBodyState();
  }
}

class HomePageBodyState extends State<HomePageBody>
    with TickerProviderStateMixin {
  late final TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomToolbar(),
        space(20),
        _tabbar(),
         space(20),
         _tabbarview(),
    
      ],
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

  Widget _tabbar() {
    return TabBar(
      labelColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      padding: const EdgeInsets.only(left: 20, right: 20),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorColor: appcolors.Primarycolor,
      tabs: const [
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          'Videos',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        Text(
          'Podcast',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        )
      ],
      controller: _tabcontroller,
    );
  }

  Widget _tabbarview() {
    return Expanded(child: TabBarView(controller: _tabcontroller,children: [
Expanded(child: Column(mainAxisSize: MainAxisSize.min,children: [ const Newsongs(),space(30),
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              children: [playlisttext(), seemoretext()],
            )),
          PlayList()
        ],
        ),
        ),const Center(child: Text('Videos'),),const  Center(child: Text('Artists'),),const Center(child: Text('Podcast'),),
    ]));
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
              onTap: () {},
              child: Column(children: [
                Stack(
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
                ),
              ])),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
              onTap: () {},
              child: Column(children: [
                Stack(
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
                ),
              ])),
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

  
}
