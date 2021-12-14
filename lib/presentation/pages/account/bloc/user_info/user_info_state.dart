part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();
}

class UserInfoInitial extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UserInfoUpdatedState extends UserInfoState {
  final User user;

  const UserInfoUpdatedState({required this.user});

  @override
  List<Object> get props => [user];
}

class LoadingState extends UserInfoState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends UserInfoState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
