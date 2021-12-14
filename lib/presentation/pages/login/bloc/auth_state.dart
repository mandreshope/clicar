part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();
}

class LoginInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class NotLoggedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedState extends AuthState {
  final Login login;

  const LoggedState({required this.login});

  @override
  List<Object?> get props => [login];
}

class ErrorState extends AuthState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
