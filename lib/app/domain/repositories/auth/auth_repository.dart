import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/auth/forgot_password.dart';
import 'package:clicar/app/domain/entities/auth/login.dart';
import 'package:clicar/app/domain/entities/auth/register.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginUser({
    required String username,
    required String password,
  });
  Future<Either<Failure, Login>> fetchCachedToken();
  Future<Either<Failure, void>> removeToken();
  Future<Either<Failure, Register>> registerUser({
    required String username,
    required String email,
    required String password,
    required String lastName,
    required String firstName,
    required String role,
  });
  Future<Either<Failure, ForgotPassword>> forgotPassword({
    required String email,
  });
  Future<Either<Failure, User>> changePassword({
    required String email,
    required String code,
    required String password,
  });
}
