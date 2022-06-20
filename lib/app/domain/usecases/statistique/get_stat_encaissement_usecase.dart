import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/statistique/encaissement_stat/encaissement_stat.dart';
import 'package:clicar/app/domain/repositories/statistique/statistique_repository.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_flotte_usecase.dart';
import 'package:dartz/dartz.dart';

class GetStatEncaissementUseCase
    implements UseCase<EncaissementStat, GetStatFlotteParams> {
  final StatistiqueRepository repository;

  GetStatEncaissementUseCase({required this.repository});
  @override
  Future<Either<Failure, EncaissementStat>> call(params) async {
    return await repository.getStatEncaissement(data: params.data);
  }
}

