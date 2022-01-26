import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchContractUseCase
    implements UseCase<List<Contract>, SearchContractParams> {
  final ContractRepository repository;

  SearchContractUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Contract>>> call(
      SearchContractParams params) async {
    return await repository.search(
      keyWord: params.keyWord,
      isSigned: params.isSigned,
      hasStartingEdl: params.hasStartingEdl,
      hasEndingEdl: params.hasEndingEdl,
    );
  }
}

class SearchContractParams extends Equatable {
  final String keyWord;
  final bool isSigned;
  final bool? hasStartingEdl;
  final bool? hasEndingEdl;

  const SearchContractParams({
    required this.keyWord,
    required this.isSigned,
    this.hasStartingEdl,
    this.hasEndingEdl,
  });

  @override
  List<Object?> get props => [keyWord, isSigned, hasStartingEdl, hasEndingEdl];
}
