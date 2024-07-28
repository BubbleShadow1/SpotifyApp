
import '../repository/auth/auth_repo.dart';

class ForgotPasswordUseCase{
  final AuthRepository repository;

  ForgotPasswordUseCase({required this.repository});

  Future<void> call(String email){
    return repository.Forgotpassword(email);
  }
}