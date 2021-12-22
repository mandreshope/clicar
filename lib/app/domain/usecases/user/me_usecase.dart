import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';

class MeUseCase implements UseCase<void, NoParams> {
  final UserRepository repository;

  MeUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.me();
  }
}
