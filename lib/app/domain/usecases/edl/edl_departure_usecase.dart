import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/edl/edl_repository.dart';
import 'package:clicar/app/domain/repositories/upload_file/upload_file_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EdlDepartureUseCase implements UseCase<Contract, EdlDepartureParams> {
  final EdlRepository repository;

  EdlDepartureUseCase({required this.repository});

  @override
  Future<Either<Failure, Contract>> call(EdlDepartureParams params) async {
    return await repository.departure(data: params.data);
  }
}

class EdlDepartureParams extends Equatable {
  final Map<String, dynamic> data;
  const EdlDepartureParams({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
