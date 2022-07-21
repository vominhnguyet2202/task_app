import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authen_event.dart';
part 'authen_state.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  AuthenBloc() : super(AuthenInitial()) {
    on<AuthenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
