import 'package:spotify/features/domain/entities/song_entities.dart';

abstract class SongRemotedatasource {
  Future<List<SongEntities>> getnewsongs();
   Future<List<SongEntities>> getsongsPlaylist();
   Future<bool> addorremovefavsong(String songId);
    Future<bool>  isFavorite(String songId);
}
