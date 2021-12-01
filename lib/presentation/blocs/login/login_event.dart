part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserCheckLoginStatusEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const UserLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class UserSkipLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
