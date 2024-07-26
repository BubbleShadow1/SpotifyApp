import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usecase.dart';
import 'package:spotify/features/data/models/auth/create_user_req.dart';
import 'package:spotify/features/domain/repository/auth/auth.dart';

import '../../../../service_locator.dart';

class RegisterCase implements Usecase<Either,CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq ? params}) {

    return sl<AuthRepository>().Register(params!);

  }


}