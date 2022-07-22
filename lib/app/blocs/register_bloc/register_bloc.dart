import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({ required this.userRepository}) : super(RegisterInitial());
 
  @override
  // ignore: override_on_non_overriding_member
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      yield RegisterLoading();

      try {
        var user = await userRepository.signUp(event.email, event.password);
        yield RegisterSucced(user: user);
      } catch (e) {
        yield RegisterFailed(message: e.toString());
      }
    }
  }
}