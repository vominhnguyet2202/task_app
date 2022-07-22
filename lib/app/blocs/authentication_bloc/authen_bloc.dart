// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:task_app/repository/user_repository.dart';

part 'authen_event.dart';
part 'authen_state.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  final UserRepository _userRepository;
  AuthenBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthenInitial());

  @override
  Stream<AuthenState> mapEventToState(AuthenEvent event) async* {
    if (event is AuthenStart) {
      yield* _onAuthenStartedToState();
    } else if (event is AuthenLogin) {
    } else if (event is AuthenLogOut) {}
  }

  Stream<AuthenState> _onAuthenStartedToState() async* {
    final isSignIn = await _userRepository.isSignIn();
    if (isSignIn) {
      final User = await _userRepository.getUser();
      yield AutheSuccess(User!);
    } else {
      yield AthenFailure();
    }
  }
}
