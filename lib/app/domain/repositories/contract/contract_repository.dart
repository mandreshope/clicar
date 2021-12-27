import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ContractRepository {
  Future<Either<Failure, List<Contract>>> search({required String keyWord});
  Future<Either<Failure, Contract>> sign(
      {required SignContractParams signContractParams});
}
