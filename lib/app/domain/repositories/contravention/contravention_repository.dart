import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/entities/contravention/contravention.dart';
import 'package:dartz/dartz.dart';

abstract class ContraventionRepository {
  Future<Either<Failure, List<Contravention>>> search({required String filter});
}
