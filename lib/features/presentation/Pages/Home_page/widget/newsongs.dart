import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/constant/image_url.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
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
            child:const Text('Nothing state happened'),
          );
        })));
  }

  Widget _songs(List<SongEntities> songs) {
    return Expanded( child:  ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(padding:const EdgeInsets.only(left: 10) ,child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                   child:Stack(children: [ Image.network(fit: BoxFit.cover,'${ImageUrl.firestorage}${songs[index].artist}-${songs[index].title}.jpg${ImageUrl.altmedia}'),   
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(shape: BoxShape.circle,color:Theme.of(context).brightness==Brightness.light ? appcolors.greycolor:appcolors.secondarycolor, 
                        ),child: Image.asset(appimages.playbtn,color:Theme.of(context).brightness==Brightness.light ? const Color.fromARGB(255, 228, 228, 228):appcolors.greycolor ,),))
                   
                   ])),
                     const SizedBox(height: 10,),
                   Text(songs[index].title!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                   const SizedBox(height: 5,),
                   Text(songs[index].artist!,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                
     
            ],
          ));
          print('Complete URL: ${ImageUrl.firestorage}${songs[index].artist}-${songs[index].title}.jpg${ImageUrl.altmedia}');

        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 14,
            ),
        itemCount: songs.length),);
      
  }
}
