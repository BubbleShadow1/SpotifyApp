import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/data/data_sources/songs/song_remotedatasource.dart';
import 'package:spotify/features/data/models/song_model.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';

class SongRemotedatasourceImpl implements SongRemotedatasource {
  FirebaseFirestore firebaseFirestore;
  SongRemotedatasourceImpl({required this.firebaseFirestore});
 @override
Future<List<SongEntities>> getnewsongs() async {
  List<SongEntities> songs = [];
  try {
    var data = await FirebaseFirestore.instance
        .collection('songs')
        .orderBy('releasedate', descending: true)
        .limit(3)
        .get();

    for (var element in data.docs) {
      var songModel = SongModel.fromJson(element.data());
      SongEntities songEntity = SongModel.toEntity(songModel);
      songs.add(songEntity);
    }
    return songs;
  } catch (e) {
    print("An error occured: $e"); // More specific error logging
    return []; // Return an empty list on error
  }
}
}
