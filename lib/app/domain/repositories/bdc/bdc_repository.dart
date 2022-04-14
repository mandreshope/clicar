import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/domain/entities/bdc/bdc.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BdcRepository {
  Future<Either<Failure, List<Bdc>>> search({required String filter});
  // Future<Either<Failure, Contract>> sign(
  //     {required SignContractParams signContractParams});
  Future<Either<Failure, UploadFileModel>> getPdf(
      {required String bdcId});

  // Future<Either<Failure, File>> downloadFile(
  //     {required String path, required String fileName});
}
