part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserCheckLoginStatusEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final String username;
  final String password;

  const UserLoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
