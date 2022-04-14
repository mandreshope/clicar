import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:clicar/app/domain/repositories/reservation/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchReservationUseCase
    implements UseCase<List<Reservation>, SearchReservationParams> {
  final ReservationRepository repository;

  SearchReservationUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Reservation>>> call(
      SearchReservationParams params) async {
    return await repository.search(
      filter: params.filter
    );
  }
}

class SearchReservationParams extends Equatable {
  final String filter;

  const SearchReservationParams({
    required this.filter,
  });

  @override
  List<Object> get props => [filter];
}
