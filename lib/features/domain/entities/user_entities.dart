

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify/features/data/models/user_model.dart';

class user_entities extends Equatable {
  final String? username;
  final String? uid;
  final String? email;
  final String? password;

  const user_entities(
      { this.uid,
      this.username,
      this.email,
      this.password});

  @override
  List<Object?> get props => [uid,username,email,password];

 factory user_entities.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        uid: snapshot.get('uid'),
        email: snapshot.get('email'),
        password: snapshot.get('password'),
        username: snapshot.get('username'));
  }

}
