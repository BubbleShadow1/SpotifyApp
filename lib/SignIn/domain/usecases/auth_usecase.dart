// domain/usecases/auth_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/SignIn/data/repository/auth/auth_repo.dart';
import 'package:spotify/SignIn/domain/failures/auth_failures.dart';


class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

Future<Either<AuthFailure, User>> signIn(String email, String password) async {
    return await _authRepository.signInWithEmailAndPassword(email, password);
  }

 Future<Either<AuthFailure, User>> signUp(String email, String password) async {
    return await _authRepository.signUpWithEmailAndPassword(email, password);
  }
}
