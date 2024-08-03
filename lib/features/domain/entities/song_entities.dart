import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntities {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releasedate;

  SongEntities({required this.title, required this.artist, required this.duration, required this.releasedate});
}
