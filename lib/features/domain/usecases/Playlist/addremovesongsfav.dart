import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/repository/songs/song_repo.dart';

class Addremovesongsfav{
  SongRepo songRepo;
  Addremovesongsfav({required this.songRepo});
  Future<bool> call(String songId) {
    return songRepo.addorremovesongsfav(songId);
  }
}
