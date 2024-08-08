import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'musicpage_state.dart';

class MusicpageCubit extends Cubit<MusicpageStateofcubit> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songduration = Duration.zero;
  Duration songposition = Duration.zero;

  MusicpageCubit() : super(MusicpageLoading()) {
    audioPlayer.positionStream.listen((position) {
      songposition = position;
      updatesongplayer();
    });

    audioPlayer.durationStream.listen((duration) {
      songduration = duration!;
    });
  }

  void updatesongplayer() {
    emit(MusicpageLoaded());
  }

  Future<void> loadsong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(MusicpageLoaded());
    } catch (e) {
      emit(MusicpageFailure());
    }
  }

  Future<void> playorpauseSong() async {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(MusicpageLoaded());
  }

  @override
  Future<void> close() async {
    super.close();
    audioPlayer.dispose();
  }

  Future<void> onchange(double value) async {
    audioPlayer.seek(Duration(seconds: value.toInt()));
    audioPlayer.positionStream.listen((position) {
      songposition = position;
      updatesongplayer();
    });
  }

  Future<void> onforward(double value) async {
    audioPlayer.seek(Duration(seconds: value.toInt() + 10));
    audioPlayer.positionStream.listen((position) {
      songposition = position;
      updatesongplayer();
    });
  }

  Future<void> onrestart() async {
    audioPlayer.seek(Duration(seconds: 0));
    audioPlayer.positionStream.listen((position) {
      songposition = position;
      updatesongplayer();
    });
  }
}
