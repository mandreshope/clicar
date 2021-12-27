part of 'user_bloc.dart';

class MeUserState extends BaseState {
  final User user;

  const MeUserState({
    required this.user,
    required Status status,
    required String message,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [user];
}
