part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class VerificationCodeSentState extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class PasswordChangedState extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ErrorState extends ForgotPasswordState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
