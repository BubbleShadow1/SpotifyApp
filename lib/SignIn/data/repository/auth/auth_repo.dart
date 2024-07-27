import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/SignIn/data/models/user.dart';
import 'package:spotify/SignIn/domain/failures/auth_failures.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<AuthFailure, User>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = Users(
          userid: userCredential.user!.uid, email: userCredential.user!.email!);

      return Right(user as User);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(InvalidEmailAndPasswordCombination());
      } else if (e.code == 'wrong-password') {
        return const Left(InvalidEmailAndPasswordCombination());
      } else {
        return Left(ServerFailure(e.message!));
      }
    }
  }

  Future<Either<AuthFailure, User>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = Users(userid:userCredential.user!.uid, email: userCredential.user!.email!);
      return Right(user as User);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Left(EmailAlreadyInUse());
      } else {
        return Left(ServerFailure(e.message!));
      }
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Users? get currentUser {
    return _firebaseAuth.currentUser != null
        ? Users(
            userid: _firebaseAuth.currentUser!.uid,
            email: _firebaseAuth.currentUser!.email!)
        : null;
  }
}
