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
