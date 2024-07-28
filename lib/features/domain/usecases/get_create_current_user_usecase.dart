

import '../entities/user_entities.dart';
import '../repository/auth/auth_repo.dart';

class GetCreateCurrentUserUseCase{
  final AuthRepository repository;

  GetCreateCurrentUserUseCase({required this.repository});

  Future<void> call(user_entities user)async{
    return repository.getcreatecurrentuser(user);
  }
}