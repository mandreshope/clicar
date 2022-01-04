part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class UploadUserPhotoFileEvent extends AccountEvent {
  final File file;

  const UploadUserPhotoFileEvent({
    required this.file,
  });

  @override
  List<Object> get props => [file];
}

class UserAddPhotoEvent extends AccountEvent {
  final String id;

  const UserAddPhotoEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class UserChangePasswordEvent extends AccountEvent {
  final String id;
  final String password;
  final String newPassword;
  const UserChangePasswordEvent({
    required this.id,
    required this.password,
    required this.newPassword,
  });

  @override
  List<Object> get props => [id, password, newPassword];
}
