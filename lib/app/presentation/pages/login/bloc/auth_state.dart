part of 'auth_bloc.dart';

class AuthState extends BaseState {
  const AuthState({
    required Status status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );
}

class RegisterLoadingState extends BaseState {
  const RegisterLoadingState({
    required Status status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );
}

class LoginLoadingState extends BaseState {
  const LoginLoadingState({
    required Status status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );
}
