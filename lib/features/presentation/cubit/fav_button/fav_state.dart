part of 'fav_cubit.dart';

abstract class FavState {}

class favstateupdated extends FavState {
  bool isfav;
  favstateupdated({required this.isfav});
}

class favstateFailure extends FavState {}
class favstateInitial extends FavState {}
