import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/appimages.dart';
import 'package:spotify/core/config/assets/appvectors.dart';
import 'package:spotify/core/config/theme/appcolors.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/presentation/cubit/fav_button/fav_cubit.dart';

class FavButton extends StatelessWidget {
  final SongEntities songEntities;
  const FavButton({super.key, required this.songEntities});
  // @override
  // State<FavButton> createState() {
  //   return FavButtonState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit(),
      child: BlocBuilder<FavCubit, FavState>(builder: (context, state) {
        if (state is favstateInitial) {
          return IconButton(
              onPressed: () {
                context.read<FavCubit>().favbuttonupdated(songEntities.songId);
              },
              icon: Image.asset(
                  songEntities.isfav ? appimages.fav : appimages.notfav));
        } else if (state is favstateupdated) {
          return IconButton(
            onPressed: () =>
                context.read<FavCubit>().favbuttonupdated(songEntities.songId),
            icon: Image.asset(state.isfav ? appimages.fav : appimages.notfav),
          );
        }
        return Container();
      }),
    );
  }
}

// class FavButtonState extends State<FavButton> {
//  @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FavCubit(),
//       child: BlocBuilder<FavCubit, FavState>(builder: (context, state) {
//         if (state is favstateInitial) {
//           return IconButton(
//               onPressed: () {
//                 context
//                     .read<FavCubit>()
//                     .favbuttonupdated(widget.songEntities.songId);
//               },
//               icon: widget.songEntities.isfav
//                   ? Image.asset(
//                       appimages.fav,
//                     )
//                   : Image.asset(appimages.notfav));
//         } else if (state is favstateupdated) {
//           return IconButton(
//               onPressed: () {
//                 context
//                     .read<FavCubit>()
//                     .favbuttonupdated(widget.songEntities.songId);
//               },
//               icon: state.isfav
//                   ? Image.asset(
//                       appimages.fav,
//                     )
//                   : Image.asset(appimages.notfav));
//         }
//         return Container();
//       }),
//     );
//   } 
// }
