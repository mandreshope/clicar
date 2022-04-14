import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/bdc/bdc.dart';
import 'package:clicar/app/domain/repositories/bdc/bdc_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchBdcUseCase
    implements UseCase<List<Bdc>, SearchBdcParams> {
  final BdcRepository repository;

  SearchBdcUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Bdc>>> call(
      SearchBdcParams params) async {
    return await repository.search(
      filter: params.filter
    );
  }
}

class SearchBdcParams extends Equatable {
  final String filter;

  const SearchBdcParams({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}
