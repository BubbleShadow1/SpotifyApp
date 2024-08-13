import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/domain/usecases/Playlist/get_songs_playlist.dart';
import 'package:spotify/injection_container.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState>{
  PlaylistCubit():super(PlaylistLoading());

 Future<void> getsongsPlaylist() async {
    var returnedsongs = await sl<GetSongsPlaylistUsecase>().call();
    print(returnedsongs);
    if (returnedsongs.isEmpty) {
      print('is empty');
      emit(PlaylistLoadedFailure());
    } else if (returnedsongs.isNotEmpty) {
      print('is not empty');
      emit(PlaylistLoaded(songs: returnedsongs));
    }
    // return returnedsongs;
  }
  
}


 

