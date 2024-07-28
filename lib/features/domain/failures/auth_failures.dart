import 'package:equatable/equatable.dart';

abstract class AuthFailure extends Equatable {
  const AuthFailure();
}

class ServerFailure extends AuthFailure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object> get props => [message];
}

class EmailAlreadyInUse extends AuthFailure {
  const EmailAlreadyInUse();

  @override
  List<Object> get props => [];
}

class InvalidEmailAndPasswordCombination extends AuthFailure {
  const InvalidEmailAndPasswordCombination();

  @override
  List<Object> get props => [];
}
