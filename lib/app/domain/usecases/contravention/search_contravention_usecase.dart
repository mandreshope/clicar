import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contravention/contravention.dart';
import 'package:clicar/app/domain/repositories/contravention/contravention_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchContraventionUseCase
    implements UseCase<List<Contravention>, SearchContraventionParams> {
  final ContraventionRepository repository;

  SearchContraventionUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Contravention>>> call(
      SearchContraventionParams params) async {
    return await repository.search(filter: params.filter);
  }
}

class SearchContraventionParams extends Equatable {
  final String filter;

  const SearchContraventionParams({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}