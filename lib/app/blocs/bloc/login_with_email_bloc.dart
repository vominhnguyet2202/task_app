import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app/repository/user_repository.dart';

part 'login_with_email_event.dart';
part 'login_with_email_state.dart';

class LoginWithEmailBloc
    extends Bloc<LoginWithEmailEvent, LoginWithEmailState> {
  UserRepository? userRepository;
  LoginWithEmailBloc({this.userRepository}) : super(LoginInitial()) {
    on<SignInButtonPressed>(_onLogin);
  }

  void _onLogin(SignInButtonPressed event, Emitter<LoginWithEmailState> emit) async{
    if(state is LoginLoading){
      try{
          User? user = await userRepository!.signIn(event.email, event.password);
          emit(LoginSucced(user: user));
      }catch(e){
        emit(LoginFailed(message: e.toString()));
      }
    }
  }
}
