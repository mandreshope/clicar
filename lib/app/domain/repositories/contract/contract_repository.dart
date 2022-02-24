import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ContractRepository {
  Future<Either<Failure, List<Contract>>> search({
    required String keyWord,
    required bool isSigned,
    bool? hasStartingEdl,
    bool? hasEndingEdl,
  });
  Future<Either<Failure, Contract>> sign(
      {required SignContractParams signContractParams});
  Future<Either<Failure, UploadFile>> getPdf({
    required Contract contract,
  });

  Future<Either<Failure, File>> downloadFile(
      {required String path, required String fileName});
}
