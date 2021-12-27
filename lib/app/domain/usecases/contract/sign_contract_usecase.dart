import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignContractUseCase implements UseCase<Contract, SignContractParams> {
  final ContractRepository repository;

  SignContractUseCase({required this.repository});

  @override
  Future<Either<Failure, Contract>> call(SignContractParams params) async {
    return await repository.sign(signContractParams: params);
  }
}

class SignContractParams extends Equatable {
  final String numberContrat;
  final Signature signature;

  const SignContractParams({
    required this.numberContrat,
    required this.signature,
  });

  @override
  List<Object> get props => [numberContrat, signature];

  Map<String, dynamic> toMap() {
    return {
      'numberContrat': numberContrat,
      'signature': signature.toMap(),
    };
  }
}

class Signature extends Equatable {
  final String signatureDate;
  final String signature;
  final bool isAccepted;

  const Signature({
    required this.signature,
    required this.signatureDate,
    required this.isAccepted,
  });

  @override
  List<Object> get props => [signatureDate, signature, isAccepted];

  Map<String, dynamic> toMap() {
    return {
      'signatureDate': signatureDate,
      'signature': signature,
      'isAccepted': isAccepted,
    };
  }
}
