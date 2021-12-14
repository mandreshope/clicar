import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/auth/login.dart';
import 'package:clicar/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FetchTokenUseCase implements UseCase<Login, TokenParams> {
  final AuthRepository repository;

  FetchTokenUseCase({required this.repository});

  @override
  Future<Either<Failure, Login>> call(TokenParams params) async {
    return await repository.fetchCachedToken();
  }
}

class TokenParams extends Equatable {
  @override
  List<Object?> get props => [];
}
