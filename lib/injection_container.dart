import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify/features/data/data_sources/firebase_remote_datasource.dart';
import 'package:spotify/features/data/data_sources/firebase_remote_datasource_impl.dart';
import 'package:spotify/features/data/data_sources/songs/song_remotedatasource.dart';
import 'package:spotify/features/data/data_sources/songs/song_remotedatasource_impl.dart';
import 'package:spotify/features/data/repository/firebase_repo_impl.dart';
import 'package:spotify/features/data/repository/song/song_repo_impl.dart';
import 'package:spotify/features/domain/repository/auth/auth_repo.dart';
import 'package:spotify/features/domain/repository/songs/song_repo.dart';
import 'package:spotify/features/domain/usecases/Playlist/addremovesongsfav.dart';
import 'package:spotify/features/domain/usecases/Playlist/get_songs_playlist.dart';
import 'package:spotify/features/domain/usecases/Playlist/isFav.dart';
import 'package:spotify/features/domain/usecases/forgot_password_usecase.dart';
import 'package:spotify/features/domain/usecases/get_create_current_user_usecase.dart';
import 'package:spotify/features/domain/usecases/get_current_uid_usecase.dart';
import 'package:spotify/features/domain/usecases/get_new_songs.dart';
import 'package:spotify/features/domain/usecases/get_userdatafirebasedatabase.dart';
import 'package:spotify/features/domain/usecases/googleauthusercase.dart';
import 'package:spotify/features/domain/usecases/is_sign_in_usecase.dart';
import 'package:spotify/features/domain/usecases/sign_in_usecase.dart';
import 'package:spotify/features/domain/usecases/sign_out_usecase.dart';
import 'package:spotify/features/domain/usecases/sign_up_usecase.dart';
import 'package:spotify/features/presentation/credential/credential_cubit.dart';
import 'package:spotify/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:spotify/features/presentation/cubit/new_songs/newsongs_cubit.dart';
import 'package:spotify/features/presentation/cubit/playlist/playlist_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
//cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      getCurrentUIDUseCase: sl.call(),
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call()));

// sl.registerLazySingleton<AuthCubit>(()=>AuthCubit(getCurrentUIDUseCase: sl.call(), isSignInUseCase:sl.call(), signOutUseCase:sl.call()));

  sl.registerLazySingleton<CredentialCubit>(() => CredentialCubit(
        googleauthusercase: sl.call(),
        forgotPasswordUseCase: sl.call(),
        signInUseCase: sl.call(),
        signUpUseCase: sl.call(),
        getCreateCurrentUserUseCase: sl.call(),
        getUserdatafirebasedatabase: sl.call(),
      ));

  sl.registerLazySingleton<NewsongsCubit>(() => NewsongsCubit());

  sl.registerLazySingleton<PlaylistCubit>(() => PlaylistCubit());
//usecases

  sl.registerLazySingleton<GetUserdatafirebasedatabase>(()=>GetUserdatafirebasedatabase(authRepository: sl.call()));
  sl.registerLazySingleton<GetSongsPlaylistUsecase>(
      () => GetSongsPlaylistUsecase(songRepo: sl.call()));

  sl.registerLazySingleton<GetNewSongsusecase>(
      () => GetNewSongsusecase(songRepo: sl.call()));

  sl.registerLazySingleton<GetCurrentUIDUseCase>(
      () => GetCurrentUIDUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));

  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<Googleauthusercase>(
      () => Googleauthusercase(repository: sl.call()));

sl.registerLazySingleton<Addremovesongsfav>(()=>Addremovesongsfav(songRepo:sl.call()));

sl.registerLazySingleton<Isfav>(()=>Isfav(songRepo: sl.call()));


  sl.registerLazySingleton<AuthRepository>(
      () => FirebaseRepoImpl(remoteDatasource: sl.call()));

  sl.registerLazySingleton<SongRepo>(
      () => SongRepoImpl(songRemotedatasource: sl.call()));

  sl.registerLazySingleton<FirebaseRemoteDatasource>(() =>
      FirebaseRemoteDatasourceImpl(
          auth: sl.call(), firestore: sl.call(), googleSignIn: sl.call()));

  sl.registerLazySingleton<SongRemotedatasource>(
      () => SongRemotedatasourceImpl(firebaseFirestore: sl.call()));

//external
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final googlesignin = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => googlesignin);
}
