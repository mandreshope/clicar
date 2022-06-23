import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat_detail.dart';
import 'package:clicar/app/domain/repositories/statistique/statistique_repository.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_flotte_usecase.dart';
import 'package:dartz/dartz.dart';

class GetVehicleStatUseCase
    implements UseCase<VehicleStatDetail, GetStatFlotteParams> {
  final StatistiqueRepository repository;

  GetVehicleStatUseCase({required this.repository});
  @override
  Future<Either<Failure, VehicleStatDetail>> call(params) async {
    return await repository.getStatVehicle(data: params.data);
  }
}