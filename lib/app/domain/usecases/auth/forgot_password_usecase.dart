import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/auth/forgot_password.dart';
import 'package:clicar/app/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ForgotPasswordUseCase
    implements UseCase<ForgotPassword, ForgotPasswordParams> {
  late AuthRepository repository;

  ForgotPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, ForgotPassword>> call(
      ForgotPasswordParams params) async {
    return await repository.forgotPassword(
      email: params.email,
    );
  }
}

class ForgotPasswordParams extends Equatable {
  final String email;

  const ForgotPasswordParams({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}
