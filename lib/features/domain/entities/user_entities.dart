import 'dart:js_interop';

import 'package:equatable/equatable.dart';

class user_entities extends Equatable {
  final String? username;
  final String? uid;
  final String? email;
  final String? password;

  const user_entities(
      {this.uid,
      this.username,
      this.email,
      this.password});

  @override
  List<Object?> get props => [uid,username,email,password];
}
