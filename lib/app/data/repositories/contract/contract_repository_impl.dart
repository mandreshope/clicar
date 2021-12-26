import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:dartz/dartz.dart';

class ContractRepositoryImpl implements ContractRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  ContractRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Contract>> search({required String keyWord}) async {
    if (await networkInfo.isConnected) {
      if (localDataSource.isExpiredToken() == false) {
        try {
          final result = await localDataSource.getLastToken();
          final remoteData = await remoteDataSource.search(keyWord: keyWord);
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
        return Left(TokenExpiredFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
