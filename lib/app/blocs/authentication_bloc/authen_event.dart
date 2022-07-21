part of 'authen_bloc.dart';

abstract class AuthenEvent extends Equatable {
  const AuthenEvent();

  @override
  List<Object> get props => [];
}

class AuthenStart extends AuthenEvent{}
class AuthenLogin extends AuthenEvent{}

class AuthenLogOut extends AuthenEvent{}

