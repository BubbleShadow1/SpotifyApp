import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/domain/entities/user_entities.dart';


abstract class AuthRepository {
  Future<void> SignIn(user_entities user);
  Future<void> SignUp(user_entities user);
  Future<void> SignOut();
  Future<bool> isSigIn();
  Future<void> Forgotpassword(String email);
  Future<void> googleAuth();
  Future<void> getUpdateuser(user_entities user);
  Future<void> getcreatecurrentuser(user_entities user);
   Future<String> GetCurrentUID();
}
