import 'package:spotify/features/data/models/user_model.dart';
import 'package:spotify/features/domain/entities/user_entities.dart';
import 'package:spotify/features/domain/repository/auth/auth_repo.dart';

class GetUserdatafirebasedatabase {
  AuthRepository authRepository;
  GetUserdatafirebasedatabase({required this.authRepository});
  Future<user_entities> call() {
    return authRepository.getUserdatafirebasedatabase();
  }
}
