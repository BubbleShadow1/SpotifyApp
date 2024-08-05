import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';

class SongModel extends SongEntities {
  SongModel({
    required String title,
    required String artist,
    required num duration,
    required Timestamp releasedate,
  }) : super(
          title: title,
          artist: artist,
          duration: duration,
          releasedate: releasedate,
        );

  factory SongModel.fromSnapshot(DocumentSnapshot snapshot) {
    return SongModel(
        title: snapshot.get('title'),
        artist: snapshot.get('artist'),
        duration: snapshot.get('duration'),
        releasedate: snapshot.get('releasedate'));
  }

  Map<String, dynamic> toDocument() {
    return {
      "title": title,
      "duration": duration,
      "artist": artist,
      "releasedate": releasedate
    };
  }

SongModel.fromJson(Map<String, dynamic> data)
  : super(
      title: data['title'],
      artist: data['artist'],
      duration: data['duration'],
      releasedate: data['releasedate'] as Timestamp, 
    );


  static SongEntities toEntity(SongModel songModel) {
    return SongEntities(
      title: songModel.title,
      artist: songModel.artist,
      duration: songModel.duration,
      releasedate: songModel.releasedate,
    );
  }
}
