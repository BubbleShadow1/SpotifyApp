import 'package:spotify/features/domain/repository/songs/song_repo.dart';

import '../entities/song_entities.dart';

class GetNewSongsusecase {
  SongRepo songRepo;
  GetNewSongsusecase({required this.songRepo});
  Future<List<SongEntities>> call() {
    return songRepo.getNewsongs();
  }
}
