import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat.dart';
import 'package:clicar/app/domain/repositories/statistique/statistique_repository.dart';
import 'package:dartz/dartz.dart';

class GetListVehicleStatUseCase
    implements UseCase<List<VehicleStat>, NoParams> {
  final StatistiqueRepository repository;

  GetListVehicleStatUseCase({required this.repository});
  @override
  Future<Either<Failure, List<VehicleStat>>> call(params) async {
    return await repository.getListStatVehicle();
  }
}