part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingUserState extends UserState {
  @override
  List<Object?> get props => [];
}

class ErrorUserState extends UserState {
  final String message;

  const ErrorUserState({required this.message});

  @override
  List<Object?> get props => [message];
}

class MeUserState extends UserState {
  final User user;

  const MeUserState({required this.user});

  @override
  List<Object> get props => [user];
}

class TokenExpiredUserState extends UserState {
  @override
  List<Object> get props => [];
}
