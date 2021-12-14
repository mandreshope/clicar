import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class MeUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  MeUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.me();
  }
}
