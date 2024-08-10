import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/domain/usecases/Playlist/isFav.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releasedate;
  bool? isfav;
  String? songId;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releasedate,
      required this.isfav,required this.songId });

  // factory SongModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   return SongModel(title: snapshot.get('title'),
  //       artist: snapshot.get('artist'),
  //       duration: snapshot.get('duration'),
  //       releasedate: snapshot.get('releasedate'));
  // }

  Map<String, dynamic> toDocument() {
    return {
      "title": title,
      "duration": duration,
      "artist": artist,
      "releasedate": releasedate
    };
  }

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releasedate = data['releasedate'] as Timestamp;
  }

  static SongEntities toEntity(SongModel songModel) {
    return SongEntities(
        title: songModel.title!,
        artist: songModel.artist!,
        duration: songModel.duration!,
        releasedate: songModel.releasedate!,
        isfav: songModel.isfav!,
        songId: songModel.songId!);
  }
}
