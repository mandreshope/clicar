import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/domain/entities/login/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> loginUser(String email, String password);
  Future<Either<Failure, Login>> fetchCachedToken();
}
