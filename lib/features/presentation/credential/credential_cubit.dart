import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify/features/domain/entities/user_entities.dart';
import 'package:spotify/features/domain/usecases/forgot_password_usecase.dart';
import 'package:spotify/features/domain/usecases/get_create_current_user_usecase.dart';
import 'package:spotify/features/domain/usecases/googleauthusercase.dart';
import 'package:spotify/features/domain/usecases/sign_in_usecase.dart';
import 'package:spotify/features/domain/usecases/sign_up_usecase.dart';
part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final Googleauthusercase googleauthusercase;

  CredentialCubit(
      {required this.signInUseCase,
      required this.signUpUseCase,
      required this.forgotPasswordUseCase,
      required this.getCreateCurrentUserUseCase,
      required this.googleauthusercase})
      : super(CredentialInitial());

  Future<void> submitSignIn({required user_entities user}) async {
    emit(CredentialLoading());
    try {
      signInUseCase.call(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> submitSignup({required user_entities user}) async {
   emit(CredentialLoading());
    try {
      await signUpUseCase.call(user);
      await getCreateCurrentUserUseCase.call(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> SubmitGoogleSignIn({required user_entities user}) async {
    try {
      googleauthusercase.googleAuth();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> ForgotPassword({required user_entities user}) async {
    try {
      forgotPasswordUseCase.call(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
