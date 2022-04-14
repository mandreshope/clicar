import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/repositories/reservation/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPdfReservationUsecase
    implements UseCase<UploadFile, GetPdfReservationParams> {
  final ReservationRepository repository;

  GetPdfReservationUsecase({required this.repository});

  @override
  Future<Either<Failure, UploadFile>> call(GetPdfReservationParams params) async {
    return await repository.getPdf(reservationId: params.reservationId);
  }
}

class GetPdfReservationParams extends Equatable {
  final String reservationId;

  const GetPdfReservationParams({
    required this.reservationId,
  });

  @override
  List<Object> get props => [reservationId];
}
