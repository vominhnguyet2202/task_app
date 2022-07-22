part of 'login_with_email_bloc.dart';

abstract class LoginWithEmailState extends Equatable {
  const LoginWithEmailState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginWithEmailState {}

class LoginLoading extends LoginWithEmailState {}

// ignore: must_be_immutable
class LoginSucced extends LoginWithEmailState {
  User? user;
  LoginSucced({ required this.user});
}

// ignore: must_be_immutable
class LoginFailed extends LoginWithEmailState {
  String message;
  LoginFailed({required this.message});
}
