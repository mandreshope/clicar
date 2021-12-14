import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordUseCase implements UseCase<User, ChangePasswordParams> {
  late AuthRepository repository;

  ChangePasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(ChangePasswordParams params) async {
    return await repository.changePassword(
      email: params.email,
      code: params.code,
      password: params.password,
    );
  }
}

class ChangePasswordParams extends Equatable {
  final String email;
  final String code;
  final String password;
  const ChangePasswordParams({
    required this.email,
    required this.code,
    required this.password,
  });

  @override
  List<Object?> get props => [email];
}
