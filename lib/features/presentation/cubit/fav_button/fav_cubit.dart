import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/domain/usecases/Playlist/addremovesongsfav.dart';
import 'package:spotify/injection_container.dart';
part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(favstateInitial());

 Future<void> favbuttonupdated(String songId) async {
  var result = await sl<Addremovesongsfav>().call(songId);
  if (result == true) {
    emit(favstateupdated(isfav: true)); // Emit new state with updated isfav
  } else {
    emit(favstateupdated(isfav: false));
  }
}
}
