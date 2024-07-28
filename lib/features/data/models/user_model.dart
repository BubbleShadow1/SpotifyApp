import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/domain/entities/user_entities.dart';

class UserModel extends user_entities {
  const UserModel(
      {final String? username,
      final String? uid,
      final String? email,
      final String? password})
      : super(uid: uid, username: username, email: email, password: password);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        uid: snapshot.get('uid'),
        email: snapshot.get('email'),
        password: snapshot.get('password'),
        username: snapshot.get('username'));
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "email": email,
      "password": password,
      "username": username
    };
  }

  
}
