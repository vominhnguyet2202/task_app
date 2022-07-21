part of 'authen_bloc.dart';

 class AuthenState extends Equatable {
  const AuthenState();

  @override
  List<Object> get props => [];
}

class AuthenInitial extends AuthenState {}

class AutheSuccess extends AuthenState {
  final User firebaseUser;

  AutheSuccess(this.firebaseUser);
  @override
  List<Object> get props => [firebaseUser];
}

class AthenFailure extends AuthenState {}
