import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SongEntities extends Equatable {
  String title;
  String artist;
  num duration;
  Timestamp releasedate;

  SongEntities(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releasedate});

  @override
  List<Object?> get props => [title,artist,duration,releasedate];
}
