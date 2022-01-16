import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:dartz/dartz.dart';

abstract class EdlRepository {
  Future<Either<Failure, Contract>> departure({
    required Map<String, dynamic> data,
  });
  Future<Either<Failure, Contract>> retour({
    required Map<String, dynamic> data,
  });
}
