
import 'package:spotify/features/domain/repository/auth/auth_repo.dart';

import '../entities/user_entities.dart';

class SignInUseCase{
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(user_entities user){
    return repository.SignIn(user);
  }
}