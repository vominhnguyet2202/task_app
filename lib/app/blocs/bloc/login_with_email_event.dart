part of 'login_with_email_bloc.dart';

abstract class LoginWithEmailEvent extends Equatable {
  const LoginWithEmailEvent();

  @override
  List<Object> get props => [];
}
// ignore: must_be_immutable
class SignInButtonPressed extends LoginWithEmailEvent {
  String email, password;
  SignInButtonPressed({required this.email, required this.password});
}
