import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> userInfoUpdate({
    required String role,
    required bool deleted,
    required String id,
    required String lastName,
    required String firstName,
    required String username,
    required String email,
  });
  Future<Either<Failure, User>> me();
}
