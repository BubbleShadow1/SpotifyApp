import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/constant/image_url.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/presentation/Pages/Home_page/Home_page.dart';

class Musicpage extends StatefulWidget {
  final SongEntities songEntities;
  const Musicpage({super.key, required this.songEntities});

  @override
  State<Musicpage> createState() {
    return MusicpageState();
  }
}

class MusicpageState extends State<Musicpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                  color: Theme.of(context).brightness == Brightness.light
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Colors.white,
                  appimages.menu),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder:(BuildContext context)=>HomePage()));
            },
            icon: Image(
                color: Theme.of(context).brightness == Brightness.light
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : Colors.white,
                image: AssetImage(appimages.leftbackbtn)),
          ),
          elevation: 0,
          title: const Center(
              child: Text(
            'Now playing',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          )),
        ),
        body: Column(crossAxisAlignment:CrossAxisAlignment.start ,children: [Padding(padding:const EdgeInsets.all(20),child: 
          Image.network(fit: BoxFit.cover,'${ImageUrl.firestorage}${widget.songEntities.artist}-${widget.songEntities.title}.jpg${ImageUrl.altmedia}',
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.height /2.5,
          ),),
      songDetails()
       
        ]));
  }


  Widget songDetails(){
    return Padding(padding:const EdgeInsets.only(left: 20,right: 20) ,child:  Row(children: [ Expanded(
            flex: 1,
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textheading(widget.songEntities.title, 28, FontWeight.bold),
                  Textheading(widget.songEntities.artist, 24, FontWeight.w500)
                ],
              ),
            ])),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Textheading(widget.songEntities.duration.toString().replaceAll('.', ':'), 20,
                    FontWeight.w300),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(appvectors.heart),
              ],
            ))]));
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
}
