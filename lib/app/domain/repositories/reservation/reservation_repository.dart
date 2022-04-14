import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:clicar/app/domain/usecases/reservation/sign_reservation_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ReservationRepository {
  Future<Either<Failure, List<Reservation>>> search({
    required String filter
  });
  Future<Either<Failure, UploadFileModel>> getPdf(
      {required String reservationId});
  Future<Either<Failure, Reservation>> sign(
      {required SignReservationParams signReservationParams});
  // Future<Either<Failure, Contract>> sign(
  //     {required SignContractParams signContractParams});
  // Future<Either<Failure, UploadFile>> getPdf({
  //   required Contract contract,
  // });

  // Future<Either<Failure, File>> downloadFile(
  //     {required String path, required String fileName});
}