import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/edl/edl_repository.dart';
import 'package:clicar/app/domain/repositories/upload_file/upload_file_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EdlRetourUseCase implements UseCase<Contract, EdlRetourParams> {
  final EdlRepository repository;

  EdlRetourUseCase({required this.repository});

  @override
  Future<Either<Failure, Contract>> call(EdlRetourParams params) async {
    return await repository.retour(data: params.data);
  }
}

class EdlRetourParams extends Equatable {
  final Map<String, dynamic> data;
  const EdlRetourParams({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
