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
    return await repository.single(file: params.file);
  }
}

class UploadSingleFileParams extends Equatable {
  final File file;

  const UploadSingleFileParams({
    required this.file,
  });

  @override
  List<Object> get props => [file];
}
