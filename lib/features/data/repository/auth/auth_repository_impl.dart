import 'package:dartz/dartz.dart';
import 'package:spotify/features/data/data_sources/auth/auth_firebase_service.dart';
import 'package:spotify/features/data/models/auth/create_user_req.dart';
import 'package:spotify/features/domain/repository/auth/auth.dart';

import '../../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> Register(CreateUserReq createuserreq) async {
   return await sl<AuthFirebaseService>().Register(createuserreq);
  }

  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

}