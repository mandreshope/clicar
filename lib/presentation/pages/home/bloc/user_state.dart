part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends UserState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class MeState extends UserState {
  final User user;
  const MeState({required this.user});

  @override
  List<Object> get props => [user];
}
