part of 'playlist_cubit.dart';

abstract class PlaylistState {}
class PlaylistLoading extends PlaylistState {}


class PlaylistLoaded extends PlaylistState {
  final List<SongEntities> songs;
  PlaylistLoaded({required this.songs});
  
}

class PlaylistLoadedFailure extends PlaylistState{}


