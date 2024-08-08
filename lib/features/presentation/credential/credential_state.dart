part of 'credential_cubit.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();
}

class CredentialInitial extends CredentialState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CredentialSuccess extends CredentialState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CredentialFailure extends CredentialState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CredentialLoading extends CredentialState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CredentialGettingSuccessfully extends CredentialState {
  @override
  List<Object?> get props => throw UnimplementedError();
  user_entities userdata;
  CredentialGettingSuccessfully({required this.userdata});
}

class CredentialGettingFailure extends CredentialState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
