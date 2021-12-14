part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();
}

class UserInfoUpdateEvent extends UserInfoEvent {
  final String username;
  final String email;
  final String lastName;
  final String firstName;
  final String role;
  final bool deleted;
  final String id;

  const UserInfoUpdateEvent({
    required this.username,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.role,
    required this.deleted,
    required this.id,
  });

  @override
  List<Object> get props => [
        username,
        email,
        lastName,
        firstName,
        role,
        deleted,
        id,
      ];
}
