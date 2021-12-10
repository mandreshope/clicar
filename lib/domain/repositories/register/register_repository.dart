import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, User>> registerUser(
    String username,
    String email,
    String password,
    String lastName,
    String firstName,
    String role,
  );
}
