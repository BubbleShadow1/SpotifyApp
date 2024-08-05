import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spotify/features/data/data_sources/songs/song_remotedatasource.dart';
import 'package:spotify/features/data/models/song_model.dart';
import 'package:spotify/features/domain/entities/song_entities.dart';
import 'package:spotify/features/domain/repository/songs/song_repo.dart';

class SongRepoImpl implements SongRepo {
  final SongRemotedatasource songRemotedatasource;
  SongRepoImpl({required this.songRemotedatasource});
  @override
  Future<List<SongEntities>> getNewsongs() async {
    return songRemotedatasource.getnewsongs();
  }
}
