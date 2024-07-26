import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either>Register(CreateUserReq createuserreq);

  Future<void>SignIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> Register(CreateUserReq createuserreq) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: createuserreq.email, password:createuserreq.password);
 return const Right('signup was Successfull');
    } on FirebaseException catch(e)
    {
String message='';
if(e.code=='weak-password')
  {
    message='The Password provided is too weak';
  }
else if(e.code=='email-already-in-use'){
  message='Email is already in use';
}
return Left(message);
    }

  }

  @override
  Future<void> SignIn() {

    throw UnimplementedError();
  }

}
