import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/auth/forgot_password.dart';
import 'package:clicar/app/domain/entities/auth/login.dart';
import 'package:clicar/app/domain/entities/auth/register.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/repositories/auth/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Login>> fetchCachedToken() async {
    try {
      final localData = await localDataSource.getLastToken();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Register>> registerUser({
    required String username,
    required String email,
    required String password,
    required String lastName,
    required String firstName,
    required String role,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.register(
          username: username,
          email: email,
          password: password,
          lastName: lastName,
          firstName: firstName,
          role: role,
        );
        await localDataSource.cacheToken(remoteData.token);
        return Right(remoteData);
      } on ServerException catch (_) {
        return Left(ServerFailure(
          message: _.message,
          statusCode: _.statusCode,
          body: _.body,
        ));
      } on SocketException catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      } catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, void>> removeToken() async {
    try {
      final localData = await localDataSource.removeToken();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Login>> loginUser({
    required String username,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.login(
          username: username,
          password: password,
        );
        await localDataSource.cacheToken(remoteData.token);
        return Right(remoteData);
      } on ServerException catch (_) {
        return Left(ServerFailure(
          message: _.message,
          statusCode: _.statusCode,
          body: _.body,
        ));
      } on SocketException catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      } catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, ForgotPassword>> forgotPassword({
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.forgotPassword(email: email);
        return Right(remoteData);
      } on ServerException catch (_) {
        return Left(ServerFailure(
          message: _.message,
          statusCode: _.statusCode,
          body: _.body,
        ));
      } on SocketException catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      } catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, User>> changePassword({
    required String email,
    required String code,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.changePassword(
          email: email,
          code: code,
          password: password,
        );
        return Right(remoteData);
      } on ServerException catch (_) {
        return Left(ServerFailure(
          message: _.message,
          statusCode: _.statusCode,
          body: _.body,
        ));
      } on SocketException catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      } catch (_) {
        return Left(ServerFailure(
          message: _.toString(),
          body: '',
          statusCode: 0,
        ));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
