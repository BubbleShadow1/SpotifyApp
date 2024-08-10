import 'package:spotify/features/domain/repository/songs/song_repo.dart';

class Isfav {
  SongRepo songRepo;
  Isfav({required this.songRepo});
  Future<bool> call(String songId) {
    return songRepo.isFavorite(songId);
  }
}
