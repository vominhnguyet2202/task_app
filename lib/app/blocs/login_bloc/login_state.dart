part of 'login_bloc.dart';

enum LoginStatus { authenticated, unauthenticated }

class LoginState extends Equatable {
  final LoginStatus status;
  final User user;
  const LoginState._({required this.status, this.user = User.empty});

  const LoginState.authenticated(User user)
      : this._(status: LoginStatus.authenticated, user: user);
  const LoginState.unauthenticated()
      : this._(status: LoginStatus.unauthenticated);
  @override
  List<Object> get props => [status, user];
}
