import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';

abstract class SongRepo {
  Future<List<SongEntities>> getNewsongs();
   Future<List<SongEntities>> getsongsPlaylist();
   Future<bool> addorremovesongsfav(String songId);
   Future<bool> isFavorite(String songId);
}
