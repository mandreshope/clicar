import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/bdc/bdc_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPdfBdcUsecase
    implements UseCase<UploadFile, GetPdfBdcParams> {
  final BdcRepository repository;

  GetPdfBdcUsecase({required this.repository});

  @override
  Future<Either<Failure, UploadFile>> call(GetPdfBdcParams params) async {
    return await repository.getPdf(bdcId: params.bdcId);
  }
}

class GetPdfBdcParams extends Equatable {
  final String bdcId;

  const GetPdfBdcParams({
    required this.bdcId,
  });

  @override
  List<Object> get props => [bdcId];
}