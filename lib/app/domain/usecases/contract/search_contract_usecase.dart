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
    return await repository.search(keyWord: params.keyWord);
  }
}

class SearchContractParams extends Equatable {
  final String keyWord;

  const SearchContractParams({
    required this.keyWord,
  });

  @override
  List<Object> get props => [keyWord];
}
