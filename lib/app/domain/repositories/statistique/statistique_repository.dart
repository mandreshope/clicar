import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/statistique/gestion_flotte_stat/gestion_flotte_stat.dart';
import 'package:dartz/dartz.dart';

abstract class StatistiqueRepository {
  Future<Either<Failure, GestionFlotteStat>> getStatFlotte({
    required Map<String, dynamic> data
  });
}