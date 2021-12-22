part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class UserCheckLoginStatusEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends AuthEvent {
  final String username;
  final String password;

  const UserLoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class UserRegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String lastName;
  final String firstName;
  final String role;

  const UserRegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.role,
  });

  @override
  List<Object> get props => [
        username,
        email,
        password,
        lastName,
        firstName,
        role,
      ];
}

class UserLogOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
