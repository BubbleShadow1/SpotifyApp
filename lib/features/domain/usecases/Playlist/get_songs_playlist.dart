import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/domain/repository/songs/song_repo.dart';

class GetSongsPlaylistUsecase {
  SongRepo songRepo;
  GetSongsPlaylistUsecase({required this.songRepo});
    Future<List<SongEntities>> call()async{
    return songRepo.getsongsPlaylist();
  }
}
