part of 'authen_bloc.dart';

abstract class AuthenState extends Equatable {
  const AuthenState();
  
  @override
  List<Object> get props => [];
}

class AuthenInitial extends AuthenState {}
