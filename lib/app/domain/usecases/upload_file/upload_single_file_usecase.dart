import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/upload_file/upload_file_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UploadSingleFileUseCase
    implements UseCase<UploadFile, UploadSingleFileParams> {
  final UploadFileRepository repository;

  UploadSingleFileUseCase({required this.repository});

  @override
  Future<Either<Failure, UploadFile>> call(
      UploadSingleFileParams params) async {
    return await repository.single(
        file: params.file, fileDestination: params.fileDestination);
  }
}

class UploadSingleFileParams extends Equatable {
  final File file;
  final String fileDestination;
  const UploadSingleFileParams({
    required this.file,
    required this.fileDestination,
  });

  @override
  List<Object> get props => [file, fileDestination];
}
