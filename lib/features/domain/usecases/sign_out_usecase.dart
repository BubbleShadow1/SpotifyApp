

import '../repository/auth/auth_repo.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call()async{
    return repository.SignOut();
  }
}