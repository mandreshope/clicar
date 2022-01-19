import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:clicar/app/domain/repositories/customer/customer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CustomerUpdateUseCase implements UseCase<Customer, CustomerUpdateParams> {
  final CustomerRepository repository;

  CustomerUpdateUseCase({required this.repository});

  @override
  Future<Either<Failure, Customer>> call(CustomerUpdateParams params) async {
    return await repository.addDocuments(data: params.data, id: params.id);
  }
}

class CustomerUpdateParams extends Equatable {
  final Map<String, dynamic> data;
  final String id;

  const CustomerUpdateParams({
    required this.data,
    required this.id,
  });

  @override
  List<Object> get props => [data, id];
}
