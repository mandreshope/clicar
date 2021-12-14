import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/auth/register.dart';
import 'package:clicar/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUseCase implements UseCase<Register, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) async {
    return await repository.registerUser(
      username: params.username,
      email: params.email,
      password: params.password,
      lastName: params.lastName,
      firstName: params.firstName,
      role: params.role,
    );
  }
}

class RegisterParams extends Equatable {
  final String username;
  final String email;
  final String password;
  final String lastName;
  final String firstName;
  final String role;

  const RegisterParams({
    required this.username,
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.role,
  });

  @override
  List<Object> get props => [
        username,
        email,
        password,
        lastName,
        firstName,
        role,
      ];
}
