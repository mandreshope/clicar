import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class DownloadFileUsecase implements UseCase<File, DownloadFileParams> {
  final ContractRepository repository;

  DownloadFileUsecase({required this.repository});

  @override
  Future<Either<Failure, File>> call(DownloadFileParams params) async {
    return await repository.downloadFile(
        fileName: params.fileName, path: params.path);
  }
}

class DownloadFileParams extends Equatable {
  final String path;
  final String fileName;

  const DownloadFileParams({
    required this.path,
    required this.fileName,
  });

  @override
  List<Object> get props => [path, fileName];
}
