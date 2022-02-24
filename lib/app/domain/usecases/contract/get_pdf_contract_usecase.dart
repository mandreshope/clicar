import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPdfContractUsecase
    implements UseCase<UploadFile, GetPdfContractParams> {
  final ContractRepository repository;

  GetPdfContractUsecase({required this.repository});

  @override
  Future<Either<Failure, UploadFile>> call(GetPdfContractParams params) async {
    return await repository.getPdf(contract: params.contract);
  }
}

class GetPdfContractParams extends Equatable {
  final Contract contract;

  const GetPdfContractParams({
    required this.contract,
  });

  @override
  List<Object> get props => [contract];
}
