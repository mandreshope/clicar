part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class UserForgotPasswordEvent extends ForgotPasswordEvent {
  final String email;

  const UserForgotPasswordEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class ChangePasswordEvent extends ForgotPasswordEvent {
  final String email;
  final String code;
  final String password;

  const ChangePasswordEvent({
    required this.email,
    required this.password,
    required this.code,
  });

  @override
  List<Object?> get props => [email];
}
