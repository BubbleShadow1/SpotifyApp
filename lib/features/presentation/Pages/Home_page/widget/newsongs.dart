import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/constant/image_url.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/features/presentation/cubit/new_songs/newsongs_cubit.dart';

import '../../../../domain/entities/song_entities.dart';

class Newsongs extends StatelessWidget {
  const Newsongs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NewsongsCubit()..getnewsongs(),
        child: Expanded(child: BlocBuilder<NewsongsCubit, NewsongsState>(
            builder: (context, state) {
          if (state is NewSongsLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          if (state is NewSongsLoaded) {
            return _songs(state.songs);
          }

          return Container(
            child: Text('Nothing state happened'),
          );
        })));
  }

  Widget _songs(List<SongEntities> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image:DecorationImage(image: NetworkImage(
                      '${ImageUrl.firestorage}${songs[index].artist}-${songs[index].title}.jpg${ImageUrl.altmedia}')),),
              )
            ],
          );
          print('Complete URL: ${ImageUrl.firestorage}${songs[index].artist}-${songs[index].title}.jpg${ImageUrl.altmedia}');  
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 14,
            ),
        itemCount: songs.length);
      
  }
}
