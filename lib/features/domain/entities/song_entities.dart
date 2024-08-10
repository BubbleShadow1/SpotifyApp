import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/features/domain/usecases/Playlist/isFav.dart';

class SongEntities extends Equatable {
  String title;
  String artist;
  num duration;
  Timestamp releasedate;
  bool isfav;
  String songId;

  SongEntities(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releasedate,
      required this.isfav,
      required this.songId});

  @override
  List<Object?> get props => [title, artist, duration, releasedate,isfav,songId];
}
