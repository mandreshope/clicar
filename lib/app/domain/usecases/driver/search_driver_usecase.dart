import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:clicar/app/domain/repositories/customer/customer_repository.dart';
import 'package:clicar/app/domain/repositories/driver/driver_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchDriverUseCase implements UseCase<List<Driver>, SearchDriverParams> {
  final DriverRepository repository;

  SearchDriverUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Driver>>> call(SearchDriverParams params) async {
    return await repository.search(filter: params.filter);
  }
}

class SearchDriverParams extends Equatable {
  final String filter;

  const SearchDriverParams({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}
