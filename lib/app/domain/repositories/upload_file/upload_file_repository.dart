import 'dart:io';

import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:dartz/dartz.dart';

abstract class UploadFileRepository {
  Future<Either<Failure, UploadFile>> single({required File file});
}
