import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/login/login.dart';
import 'package:clicar/domain/repositories/login/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase implements UseCase<Login, LoginParams> {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return await repository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
