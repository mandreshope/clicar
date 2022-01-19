import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:clicar/app/domain/repositories/driver/driver_repository.dart';
import 'package:clicar/app/domain/repositories/vehicle/vehicle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VehicleUpdateUseCase implements UseCase<Vehicle, VehicleUpdateParams> {
  final VehicleRepository repository;

  VehicleUpdateUseCase({required this.repository});

  @override
  Future<Either<Failure, Vehicle>> call(VehicleUpdateParams params) async {
    return await repository.addDocuments(data: params.data, id: params.id);
  }
}

class VehicleUpdateParams extends Equatable {
  final Map<String, dynamic> data;
  final String id;

  const VehicleUpdateParams({
    required this.data,
    required this.id,
  });

  @override
  List<Object> get props => [data, id];
}
