part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LogoutRequested extends LoginEvent {}

class UserChange extends LoginEvent {
  final User user;
  const UserChange(this.user);

  @override
  List<Object> get props => [user];
}
