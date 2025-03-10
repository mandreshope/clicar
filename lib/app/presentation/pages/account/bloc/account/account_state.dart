part of 'account_bloc.dart';

class AccountInitial extends BaseState {
  const AccountInitial({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class UserAddPhotoSuccessState extends BaseState {
  const UserAddPhotoSuccessState({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class UserChangePasswordSuccessState extends BaseState {
  const UserChangePasswordSuccessState({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class UserChangePasswordLoadinState extends BaseState {
  const UserChangePasswordLoadinState({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}
