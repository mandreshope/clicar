import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:clicar/app/domain/repositories/customer/customer_repository.dart';
import 'package:clicar/app/domain/repositories/driver/driver_repository.dart';
import 'package:clicar/app/domain/repositories/vehicle/vehicle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchVehicleUseCase
    implements UseCase<List<Vehicle>, SearchVehicleParams> {
  final VehicleRepository repository;

  SearchVehicleUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Vehicle>>> call(
      SearchVehicleParams params) async {
    return await repository.search(filters: params.filters);
  }
}

class SearchVehicleParams extends Equatable {
  final Map<String, dynamic> filters;

  const SearchVehicleParams({
    required this.filters,
  });

  @override
  List<Object> get props => [filters];
}
