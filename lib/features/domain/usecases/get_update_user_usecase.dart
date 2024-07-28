

import 'package:spotify/features/domain/entities/user_entities.dart';
import 'package:spotify/features/domain/repository/auth/auth_repo.dart';

class GetUpdateUserUseCase{
  final AuthRepository repository;

  GetUpdateUserUseCase({required this.repository});
  Future<void> call(user_entities user){
    return repository.getUpdateuser(user);
  }
}