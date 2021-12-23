part of 'user_info_bloc.dart';

class UserInfoUpdatedState extends BaseState {
  final User user;

  const UserInfoUpdatedState({
    required this.user,
    required status,
    required message,
  }) : super(status: status, message: message);
}
