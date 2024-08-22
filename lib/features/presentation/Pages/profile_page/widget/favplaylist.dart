import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/features/presentation/Pages/Music_Page/pages/musicpage.dart';
import 'package:spotify/features/presentation/cubit/playlist/playlist_cubit.dart';
import '../../../../domain/entities/song_entities.dart';
import '../../../cubit/fav_button/fav_cubit.dart';

class Favplaylist extends StatefulWidget {
  const Favplaylist({super.key});
  @override
  State<StatefulWidget> createState() {
    return Favplayliststate();
  }
}

class Favplayliststate extends State<Favplaylist> {
   void removeItem(int index, List<SongEntities> songentities) {
    setState(() {
      songentities.removeAt(index);
    });
  }
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
          List<SongEntities> songslist = state.songs;
          List<SongEntities> favlist = [];
          for (int i = 0; i < state.songs.length; i++) {
            if (songslist[i].isfav) {
              favlist.add(songslist[i]);
            }
          }
          return _songs(favlist);
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
                            builder: (BuildContext context) => Musicpage(
                                  songEntities: songs[index],
                                )));
                  },
                  child: customlist(
                      songs,
                      songs[index].title,
                      songs[index].artist,
                      songs[index].duration,
                      songs[index].isfav,
                      songs[index],
                      context,
                      index));
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: songs.length));
  }

 

  Widget customlist(
      List<SongEntities> songlist,
      String songname,
      String artistname,
      num duration,
      bool fav,
      SongEntities songEntities,
      BuildContext context,
      int index) {
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
                fav_buttonoffavlist(songlist, songEntities, index)
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

  Widget fav_buttonoffavlist(
      List<SongEntities> songentities, SongEntities songEntities, index) {
    return BlocProvider(
      create: (context) => FavCubit(),
      child: BlocBuilder<FavCubit, FavState>(builder: (context, state) {
        if (state is favstateInitial) {
          return IconButton(
              onPressed: () {
                context.read<FavCubit>().favbuttonupdated(songEntities.songId);
                removeItem(index, songentities);
              },
              icon: Image.asset(
                  songEntities.isfav ? appimages.fav : appimages.notfav));
        } else if (state is favstateupdated) {
          return IconButton(
            onPressed: () {
              context.read<FavCubit>().favbuttonupdated(songEntities.songId);
              removeItem(index, songentities);
            },
            icon: Image.asset(state.isfav ? appimages.fav : appimages.notfav),
          );
        }
        return Container();
      }),
    );
  }
}
