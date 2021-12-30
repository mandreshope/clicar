import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UserChangePasswordUseCase
    implements UseCase<bool, UserChangePasswordParams> {
  final UserRepository repository;

  UserChangePasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(UserChangePasswordParams params) async {
    return await repository.addPhoto(photo: params.password, id: params.id);
  }
}

class UserChangePasswordParams extends Equatable {
  final String password;
  final String id;

  const UserChangePasswordParams({
    required this.password,
    required this.id,
  });

  @override
  List<Object> get props => [password, id];
}
