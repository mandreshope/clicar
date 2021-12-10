part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class UserRegisterEvent extends RegisterEvent {
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
