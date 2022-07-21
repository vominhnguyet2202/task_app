
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../entities/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.unauthenticated()) {
    on<UserChange>(_onUserChange);
    on<LogoutRequested>(_onLogoutRequest);
  }
  void _onUserChange(UserChange event, Emitter<LoginState> emit){

  }
  void _onLogoutRequest(LogoutRequested event, Emitter<LoginState> emit){
    
  }
}
