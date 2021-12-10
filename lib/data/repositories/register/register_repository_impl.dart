import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/network/network_info.dart';
import 'package:clicar/data/sources/local/local_source.dart';
import 'package:clicar/data/sources/remote/remote_source.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/repositories/register/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> registerUser(
    String username,
    String email,
    String password,
    String lastName,
    String firstName,
    String role,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.register(
          username,
          email,
          password,
          lastName,
          firstName,
          role,
        );
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
}
