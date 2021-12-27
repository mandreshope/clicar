import 'package:equatable/equatable.dart';

class BaseState extends Equatable {
  final Status status;
  final String message;

  const BaseState({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}

enum Status {
  initial,
  loginInitial,
  notLogged,
  loading,
  success,
  logged,
  meUser,
  userInfoUpdated,
  error,
  tokenExpired,
}
