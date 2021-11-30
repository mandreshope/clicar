import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/network/network_info.dart';
import 'package:clicar/data/sources/local/login/login_local_source.dart';
import 'package:clicar/data/sources/remote/login/login_remote_source.dart';
import 'package:clicar/domain/entities/login/login.dart';
import 'package:clicar/domain/repositories/login/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteSource remoteDataSource;
  final LoginLocalSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Login>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.login(email, password);
        localDataSource.cacheToken(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
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
