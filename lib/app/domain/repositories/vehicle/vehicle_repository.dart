import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:dartz/dartz.dart';

abstract class VehicleRepository {
  Future<Either<Failure, Vehicle>> addDocuments({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<Either<Failure, List<Vehicle>>> search(
      {required Map<String, dynamic> filters});
}
