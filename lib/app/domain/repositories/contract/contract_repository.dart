import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:dartz/dartz.dart';

abstract class ContractRepository {
  Future<Either<Failure, Contract>> search({required String keyWord});
}
