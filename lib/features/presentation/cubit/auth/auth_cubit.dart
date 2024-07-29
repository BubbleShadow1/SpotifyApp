import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/domain/usecases/get_current_uid_usecase.dart';
import 'package:spotify/features/domain/usecases/is_sign_in_usecase.dart';
import 'package:spotify/features/domain/usecases/sign_out_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUIDUseCase getCurrentUIDUseCase;
  final SignOutUseCase signOutUseCase;
  AuthCubit(
      {required this.getCurrentUIDUseCase,
      required this.isSignInUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());
  Future<void> appstarted() async {
    try {
      final IsSignIn = await isSignInUseCase.call();
      if (IsSignIn) {
        final uid = await getCurrentUIDUseCase.call();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(unAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(unAuthenticatedState());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUIDUseCase.call();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(unAuthenticatedState());
    }
  }

  Future<void> loggedout() async {
    try {
      signOutUseCase.call();
      emit(unAuthenticatedState());
    } catch (_) {
      emit(unAuthenticatedState());
    }
  }
}
