import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/repositories/customer/customer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchCustomerUseCase
    implements UseCase<List<Customer>, SearchCustomerParams> {
  final CustomerRepository repository;

  SearchCustomerUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Customer>>> call(
      SearchCustomerParams params) async {
    return await repository.search(filter: params.filter);
  }
}

class SearchCustomerParams extends Equatable {
  final String filter;

  const SearchCustomerParams({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}
