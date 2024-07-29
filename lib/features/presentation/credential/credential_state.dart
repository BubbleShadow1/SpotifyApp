part of 'credential_cubit.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();
}

class CredentialInitial extends CredentialState{
  @override
  List<Object?> get props => throw UnimplementedError();
  
}
class CredentialSuccess extends CredentialState{
  @override
  List<Object?> get props => throw UnimplementedError();
  

}
class CredentialFailure extends CredentialState{
  @override
  List<Object?> get props => throw UnimplementedError();
  
  
}
class CredentialLoading extends CredentialState{
  @override
  List<Object?> get props => throw UnimplementedError();
  
  
}

