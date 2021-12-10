import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/network/network_info.dart';
import 'package:clicar/data/sources/local/local_source.dart';
import 'package:clicar/data/sources/remote/remote_source.dart';
import 'package:clicar/domain/entities/login/login.dart';
import 'package:clicar/domain/repositories/login/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Login>> loginUser(
      String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.login(username, password);
        localDataSource.cacheToken(remoteData);
        return Right(remoteData);
      } on ServerException catch (_) {
        return Left(ServerFailure(message: _.message));
      } on SocketException catch (_) {
        return Left(ServerFailure(message: _.toString()));
      } catch (_) {
        return Left(ServerFailure(message: _.toString()));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Login>> fetchCachedToken() async {
    try {
      final localData = await localDataSource.getLastToken();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
