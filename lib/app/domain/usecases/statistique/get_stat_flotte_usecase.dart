import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/statistique/gestion_flotte_stat/gestion_flotte_stat.dart';
import 'package:clicar/app/domain/repositories/statistique/statistique_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetStatFlotteUseCase
    implements UseCase<GestionFlotteStat, GetStatFlotteParams> {
  final StatistiqueRepository repository;

  GetStatFlotteUseCase({required this.repository});
  @override
  Future<Either<Failure, GestionFlotteStat>> call(params) async {
    return await repository.getStatFlotte(data: params.data);
  }
}

class GetStatFlotteParams extends Equatable {
  final Map<String, dynamic> data;
  const GetStatFlotteParams({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
