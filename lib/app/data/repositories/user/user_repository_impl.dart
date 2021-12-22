import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> me() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.me();
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
  Future<Either<Failure, User>> userInfoUpdate({
    required String role,
    required bool deleted,
    required String id,
    required String lastName,
    required String firstName,
    required String username,
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await localDataSource.getLastToken();
        final remoteData = await remoteDataSource.userInfoUpdate(
            token: result.token,
            role: role,
            deleted: deleted,
            id: id,
            lastName: lastName,
            firstName: firstName,
            username: username,
            email: email);
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
