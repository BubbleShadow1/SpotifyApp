

import '../repository/auth/auth_repo.dart';

class GoogleSignInUseCase{
  final AuthRepository repository;

  GoogleSignInUseCase({required this.repository});

  Future<void> call(){
    return repository.googleAuth();
  }
}