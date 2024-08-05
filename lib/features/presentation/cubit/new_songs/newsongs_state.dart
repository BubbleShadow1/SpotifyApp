part of 'newsongs_cubit.dart';

abstract class NewsongsState {}

class NewSongsLoading extends NewsongsState {}


class NewSongsLoaded extends NewsongsState {

  final List<SongEntities> songs;
  NewSongsLoaded({required this.songs});
  
}

class NewSongsLoadedFailure extends NewsongsState{}


