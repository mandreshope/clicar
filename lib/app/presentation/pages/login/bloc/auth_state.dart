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
