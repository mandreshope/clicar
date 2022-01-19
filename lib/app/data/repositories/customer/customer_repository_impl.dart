import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/repositories/customer/customer_repository.dart';
import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  CustomerRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Customer>> addDocuments(
      {required Map<String, dynamic> data, required String id}) async {
    // TODO: implement addDocuments
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Customer>>> search(
      {required String filter}) async {
    // TODO: implement search
    throw UnimplementedError();
  }
}
