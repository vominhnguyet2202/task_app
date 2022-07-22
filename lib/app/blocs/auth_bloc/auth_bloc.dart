import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository? userRepository;
  AuthBloc({ this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      try {
        var isSignedIn = await userRepository!.isSignIn();

        if (isSignedIn) {
          var user = await userRepository!
            .getUser();

          yield AuthenticateState(user: user);
        } else {
          yield UnAuthenticateState();
        }
      } catch (e) {
        yield UnAuthenticateState();
      }
    }
  }
}
