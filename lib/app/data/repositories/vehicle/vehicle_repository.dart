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
  Future<Either<Failure, Customer>> addDocuments(
      {required Map<String, dynamic> data, required String id}) async {
    // TODO: implement addDocuments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Vehicle>>> search(
      {required Map<String, dynamic> filters}) async {
    // TODO: implement search
    throw UnimplementedError();
  }
}
