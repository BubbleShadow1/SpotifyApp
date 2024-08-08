import 'package:spotify/features/data/data_sources/firebase_remote_datasource.dart';
import 'package:spotify/features/domain/entities/user_entities.dart';
import 'package:spotify/features/domain/repository/auth/auth_repo.dart';

class FirebaseRepoImpl implements AuthRepository {
  final FirebaseRemoteDatasource remoteDatasource;

  FirebaseRepoImpl({required this.remoteDatasource});

  @override
  Future<void> Forgotpassword(String email) {
    return remoteDatasource.Forgotpassword(email);
  }

  @override
  Future<String> GetCurrentUID() {
    return remoteDatasource.GetCurrentUID();
  }

  @override
  Future<void> SignIn(user_entities user) {
    return remoteDatasource.SignIn(user);
  }

  @override
  Future<void> SignOut() {
    return remoteDatasource.SignOut();
  }

  @override
  Future<void> SignUp(user_entities user) {
    return remoteDatasource.SignUp(user);
  }

  @override
  Future<void> getUpdateuser(user_entities user) {
    return remoteDatasource.getUpdateuser(user);
  }

  @override
  Future<void> getcreatecurrentuser(user_entities user) {
    return remoteDatasource.getcreatecurrentuser(user);
  }

  @override
  Future<void> googleAuth() {
    return remoteDatasource.googleAuth();
  }

  @override
  Future<bool> isSigIn() {
    return remoteDatasource.isSigIn();
  }

  @override
  Future<user_entities> getUserdatafirebasedatabase() {
    return remoteDatasource.getUserdatafirebasedatabase();
  }
}
