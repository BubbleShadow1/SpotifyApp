import 'package:spotify/features/domain/entities/song_entities.dart';

abstract class SongRepo {
  Future<List<SongEntities>> getNewsongs();
}
