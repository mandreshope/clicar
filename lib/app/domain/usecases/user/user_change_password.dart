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
    return await repository.changePassword(
        newPassword: params.newPassword,
        password: params.password,
        id: params.id);
  }
}

class UserChangePasswordParams extends Equatable {
  final String password;
  final String id;
  final String newPassword;

  const UserChangePasswordParams({
    required this.password,
    required this.id,
    required this.newPassword,
  });

  @override
  List<Object> get props => [password, id, newPassword];
}
