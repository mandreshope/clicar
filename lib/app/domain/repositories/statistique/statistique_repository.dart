import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/data/models/statistique/vehicle_stat/vehicle_stat_detail_model.dart';
import 'package:clicar/app/data/models/statistique/vehicle_stat/vehicle_stat_model.dart';
import 'package:clicar/app/domain/entities/statistique/encaissement_stat/encaissement_stat.dart';
import 'package:clicar/app/domain/entities/statistique/gestion_flotte_stat/gestion_flotte_stat.dart';
import 'package:dartz/dartz.dart';

abstract class StatistiqueRepository {
  Future<Either<Failure, GestionFlotteStat>> getStatFlotte(
      {required Map<String, dynamic> data});

  Future<Either<Failure, EncaissementStat>> getStatEncaissement(
      {required Map<String, dynamic> data});

  Future<Either<Failure, List<VehicleStatModel>>> getListStatVehicle();

  Future<Either<Failure, VehicleStatDetailModel>> getStatVehicle(
      {required Map<String, dynamic> data});
}
