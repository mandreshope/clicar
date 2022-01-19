import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:dartz/dartz.dart';

abstract class DriverRepository {
  Future<Either<Failure, Driver>> addDocuments({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<Either<Failure, List<Driver>>> search({required String filter});
}
