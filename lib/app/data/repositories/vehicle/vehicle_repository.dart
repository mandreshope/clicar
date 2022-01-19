import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:clicar/app/domain/repositories/vehicle/vehicle_repository.dart';
import 'package:dartz/dartz.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  VehicleRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Vehicle>> addDocuments(
      {required Map<String, dynamic> data, required String id}) async {
    if (await networkInfo.isConnected) {
      if (localDataSource.isExpiredToken() == false) {
        try {
          final remoteData =
              await remoteDataSource.vehicleUpdate(data: data, id: id);
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

  @override
  Future<Either<Failure, List<Vehicle>>> search(
      {required Map<String, dynamic> filters}) async {
    if (await networkInfo.isConnected) {
      if (localDataSource.isExpiredToken() == false) {
        try {
          final remoteData =
              await remoteDataSource.searchVehicle(filters: filters);
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
