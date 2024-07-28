

import '../repository/auth/auth_repo.dart';

class Googleauthusercase {
  final AuthRepository repository;
  Googleauthusercase({required this.repository});

  Future<void> googleAuth() {
    return repository.googleAuth();
  }
}
