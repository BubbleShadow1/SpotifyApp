

import '../entities/user_entities.dart';
import '../repository/auth/auth_repo.dart';

class SignUpUseCase{
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(user_entities user){
    return repository.SignUp(user);
  }
}