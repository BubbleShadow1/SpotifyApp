import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/features/presentation/Pages/Home_page/Home_page.dart';
import 'package:spotify/features/presentation/Pages/Music_Page/pages/musicpage.dart';
import 'package:spotify/features/presentation/cubit/new_songs/newsongs_cubit.dart';
import 'package:spotify/features/presentation/cubit/playlist/playlist_cubit.dart';

import '../../../../domain/entities/song_entities.dart';

class PlayList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getsongsPlaylist(),
      child:
          BlocBuilder<PlaylistCubit, PlaylistState>(builder: (context, state) {
        if (state is PlaylistLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (state is PlaylistLoaded) {
          return _songs(state.songs);
        }
        return Container(
          child: const Text('No data is Fetching '),
        );
      }),
    );
  }

  Widget _songs(List<SongEntities> songs) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Musicpage(songEntities: songs[index],)));
                  },
                  child: customlist(songs[index].title, songs[index].artist,
                      songs[index].duration, context));
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: songs.length));
  }

  Widget customlist(
      String songname, String artistname, num duration, BuildContext context) {
    return Expanded(
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: AssetImage(appimages.greybg)),
          ),
          child: Center(child: Image.asset(appimages.playbtn)),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 1,
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textheading(songname, 18, FontWeight.bold),
                  Textheading(artistname, 15, FontWeight.w400)
                ],
              ),
            ])),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Textheading(duration.toString().replaceAll('.', ':'), 20,
                    FontWeight.w300),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(appvectors.heart),
              ],
            ))
      ]),
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
}
