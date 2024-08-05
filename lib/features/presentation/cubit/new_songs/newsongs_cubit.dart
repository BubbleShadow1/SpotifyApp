import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/domain/usecases/get_new_songs.dart';
import 'package:spotify/injection_container.dart';
part 'newsongs_state.dart';

class NewsongsCubit extends Cubit<NewsongsState> {
  NewsongsCubit() : super(NewSongsLoading());

  Future<void> getnewsongs() async {
    var returnedsongs = await sl<GetNewSongsusecase>().call();
    print(returnedsongs);
    if (returnedsongs.isEmpty) {
      print('is empty');
      emit(NewSongsLoadedFailure());
    } else if (returnedsongs.isNotEmpty) {
      print('is not empty');
      emit(NewSongsLoaded(songs: returnedsongs));
    }
    // return returnedsongs;
  }
}
