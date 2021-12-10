part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class NotLoggedState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoggedState extends LoginState {
  final Login login;

  const LoggedState({required this.login});

  @override
  List<Object?> get props => [login];
}

class ErrorState extends LoginState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
