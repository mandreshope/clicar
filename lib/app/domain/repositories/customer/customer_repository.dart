import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepository {
  Future<Either<Failure, Customer>> addDocuments({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<Either<Failure, List<Customer>>> search({required String filter});
}
