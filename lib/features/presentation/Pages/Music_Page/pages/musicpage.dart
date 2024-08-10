import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/constant/image_url.dart';
import 'package:spotify/common/constant/music_url.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/presentation/Pages/Home_page/Home_page.dart';
import 'package:spotify/features/presentation/Pages/Home_page/widget/fav_button.dart';
import 'package:spotify/features/presentation/cubit/music_page/musicpage_cubit.dart';

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
              Navigator.pop(context);
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
        body: BlocProvider(
            create: (_) => MusicpageCubit()
              ..loadsong(
                  '${MusicUrl.songfirestorage}${widget.songEntities.artist}-${widget.songEntities.title}.mp3${MusicUrl.altmedia}'),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  fit: BoxFit.cover,
                  '${ImageUrl.firestorage}${widget.songEntities.artist}-${widget.songEntities.title}.jpg${ImageUrl.altmedia}',
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.height / 2.5,
                ),
              ),
              songDetails(),
              _songplayer(context)
            ])));
  }

  Widget songDetails() {
    return Container(
        height: MediaQuery.of(context).size.height / 8,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textheading(
                            widget.songEntities.title!, 28, FontWeight.bold),
                        Textheading(
                            widget.songEntities.artist!, 24, FontWeight.w500)
                      ],
                    ),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                     FavButton(songEntities: widget.songEntities)
                    ],
                  ),
                ])));
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

  Widget _songplayer(BuildContext context) {
    return BlocBuilder<MusicpageCubit, MusicpageStateofcubit>(
      builder: (context, state) {
        if (state is MusicpageLoading) {
          return const CircularProgressIndicator();
        } else if (state is MusicpageLoaded) {
          print('musicpage is loaded');
          return Expanded(
              child: Column(
            children: [
              Slider(
                activeColor: Theme.of(context).brightness == Brightness.light
                    ? appcolors.Primarycolor
                    : Colors.white,
                inactiveColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey
                    : Colors.white,
                value: context
                    .read<MusicpageCubit>()
                    .songposition
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {
                  context.read<MusicpageCubit>().onchange(value);
                },
                min: 0.0,
                max: context
                    .read<MusicpageCubit>()
                    .songduration
                    .inSeconds
                    .toDouble(),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(formatofDuration(
                        context.read<MusicpageCubit>().songposition))),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(formatofDuration(
                      context.read<MusicpageCubit>().songduration)),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  GestureDetector(
                  onTap: () {
                     
                  },
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Image.asset(appimages.repeatbtn),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {

                    context.read<MusicpageCubit>().onrestart();

                  },
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Image.asset(appimages.Previousbtn),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<MusicpageCubit>().playorpauseSong();
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: appcolors.Primarycolor,
                    ),
                    child: Center(
                      child:
                          context.read<MusicpageCubit>().audioPlayer.playing ==
                                  true
                              ? Image.asset(appimages.Pausebtn)
                              : Image.asset(appimages.playbtn,color: Colors.white,),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      context.read<MusicpageCubit>().onforward(context
                    .read<MusicpageCubit>()
                    .songposition
                    .inSeconds
                    .toDouble());
                  },
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Image.asset(appimages.Nextbtn),
                    ),
                  ),
                ),
                  GestureDetector(
                  onTap: () {
                     
                  },
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Center(
                      child: Image.asset(appimages.shufflebtn),
                    ),
                  ),
                )
              ]),
             const SizedBox(height: 50,),
               GestureDetector(
                  onTap: () {
                     //To do
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(
                      child: Image.asset(fit: BoxFit.fill,appimages.upbtn),
                    ),
                  ),
                ),
               const Text('Lyrics',style:TextStyle(fontWeight: FontWeight.w500) ,),
            ],
          ));
        } else if (state is MusicpageFailure) {}
        return const Text('No state');
      },
    );
  }

  String formatofDuration(Duration duration) {
    final min = duration.inMinutes.remainder(60);
    final sec = duration.inSeconds.remainder(60);
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }
}
