import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/data/data_sources/songs/song_remotedatasource.dart';
import 'package:spotify/features/data/models/song_model.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/domain/usecases/Playlist/get_songs_playlist.dart';
import 'package:spotify/features/domain/usecases/Playlist/isFav.dart';
import 'package:spotify/features/domain/usecases/get_new_songs.dart';
import 'package:spotify/injection_container.dart';

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
          .limit(6)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isfav = await sl<Isfav>().call(element.reference.id);
        songModel.isfav = isfav;
        songModel.songId = element.reference.id;
        SongEntities songEntity = SongModel.toEntity(songModel);
        songs.add(songEntity);
      }
      return songs;
    } catch (e) {
      print("An error occured: $e");
      return [];
    }
  }

  @override
  Future<List<SongEntities>> getsongsPlaylist() async {
    List<SongEntities> songs = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releasedate', descending: true)
          .limit(6)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isfav = await sl<Isfav>().call(element.reference.id);
        songModel.isfav = isfav;
        songModel.songId = element.reference.id;
        SongEntities songEntity = SongModel.toEntity(songModel);
        songs.add(songEntity);
      }
      return songs;
    } catch (e) {
      print("An error occured: $e"); // More
      return []; // Return an empty list on error
    }
  }

  @override
  Future<bool> addorremovefavsong(String songId) async {
    try {
      final firebaseauth = FirebaseAuth.instance;
      late bool isFavorite;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final uid = firebaseauth.currentUser?.uid;
      QuerySnapshot favoritesong = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('fav')
          .where('songId', isEqualTo: songId)
          .get();

      if (favoritesong.docs.isNotEmpty) {
        await favoritesong.docs.first.reference.delete();
        isFavorite = false;
        return isFavorite;
      } else if (favoritesong.docs.isEmpty) {
        await firebaseFirestore
            .collection('users')
            .doc(uid)
            .collection('fav')
            .add({'songId': songId, 'addedDate': Timestamp.now()});
        isFavorite = true;
      }
        //  sl<GetSongsPlaylistUsecase>().call();
      return isFavorite;
    } catch (e) {
      print('An error occcured');
        //  sl<GetSongsPlaylistUsecase>().call();
      return false;
    }
 
  }

  @override
  Future<bool> isFavorite(String songId) async {
    try {
      final firebaseauth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final uid = firebaseauth.currentUser?.uid;
      QuerySnapshot favoritesong = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('fav')
          .where('songId', isEqualTo: songId)
          .get();

      if (favoritesong.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('error message at isfav in songremotedatasource_impl:${e}');
      return false;
    }
  }
}
