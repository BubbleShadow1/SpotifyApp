
import '../repository/auth/auth_repo.dart';

class IsSignInUseCase {

  final AuthRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call()async{
    return repository.isSigIn();
  }
}