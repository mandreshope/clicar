import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/upload_file/upload_file_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UploadMultiFileUseCase
    implements UseCase<List<UploadFile>, UploadMultiFileParams> {
  final UploadFileRepository repository;

  UploadMultiFileUseCase({required this.repository});

  @override
  Future<Either<Failure, List<UploadFile>>> call(
      UploadMultiFileParams params) async {
    return await repository.multi(
        files: params.files, fileDestination: params.fileDestination);
  }
}

class UploadMultiFileParams extends Equatable {
  final List<File> files;
  final String fileDestination;
  const UploadMultiFileParams({
    required this.files,
    required this.fileDestination,
  });

  @override
  List<Object> get props => [files, fileDestination];
}
