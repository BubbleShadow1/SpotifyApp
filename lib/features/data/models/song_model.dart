import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';

class SongModel extends SongEntities{
  SongModel({required super.title, required super.artist, required super.duration, required super.releasedate});

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