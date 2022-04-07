import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/contravention/contravention.dart';
import 'package:clicar/app/domain/repositories/contravention/contravention_repository.dart';
import 'package:dartz/dartz.dart';

class ContraventionRepositoryImpl implements ContraventionRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;
  ContraventionRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Contravention>>> search(
      {required String filter}) async {
    if (await networkInfo.isConnected) {
      if (localDataSource.isExpiredToken() == false) {
        try {
          final remoteData =
              await remoteDataSource.searchContravention(filter: filter);
          return Right(remoteData);
        } on ServerException catch (_) {
          return Left(
            ServerFailure(
              message: _.message, 
              statusCode: _.statusCode, 
              body: _.body
            ),
          );
        } on SocketException catch (_) {
          return Left(ServerFailure(
            message: _.toString(),
            body: '',
            statusCode: 0,
          ),);
        } catch (_) {
          print("error; ${_.toString()}");
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
