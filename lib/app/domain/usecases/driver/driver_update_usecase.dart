import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:clicar/app/domain/repositories/driver/driver_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DriverUpdateUseCase implements UseCase<Driver, DriverUpdateParams> {
  final DriverRepository repository;

  DriverUpdateUseCase({required this.repository});

  @override
  Future<Either<Failure, Driver>> call(DriverUpdateParams params) async {
    return await repository.addDocuments(data: params.data, id: params.id);
  }
}

class DriverUpdateParams extends Equatable {
  final Map<String, dynamic> data;
  final String id;

  const DriverUpdateParams({
    required this.data,
    required this.id,
  });

  @override
  List<Object> get props => [data, id];
}
