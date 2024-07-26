import 'package:dartz/dartz.dart';
import 'package:spotify/features/data/models/auth/create_user_req.dart';

abstract class AuthRepository{

  Future<Either> Register(CreateUserReq createuserreq);
  Future<void> signIn();

}