import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UserAddPhotoUseCase implements UseCase<bool, UserAddPhotoParams> {
  final UserRepository repository;

  UserAddPhotoUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(UserAddPhotoParams params) async {
    return await repository.addPhoto(photo: params.photo, id: params.id);
  }
}

class UserAddPhotoParams extends Equatable {
  final String photo;
  final String id;

  const UserAddPhotoParams({
    required this.photo,
    required this.id,
  });

  @override
  List<Object> get props => [photo, id];
}
