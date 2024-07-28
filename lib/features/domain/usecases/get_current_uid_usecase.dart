
import '../repository/auth/auth_repo.dart';

class GetCurrentUIDUseCase{
  final AuthRepository repository;

  GetCurrentUIDUseCase({required this.repository});
  Future<String> call()async{
    return await repository.GetCurrentUID();
  }
}