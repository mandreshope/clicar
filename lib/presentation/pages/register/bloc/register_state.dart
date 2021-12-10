part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoadingState extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisteredState extends RegisterState {
  final User user;

  const RegisteredState({required this.user});

  @override
  List<Object?> get props => [user];
}

class ErrorState extends RegisterState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
