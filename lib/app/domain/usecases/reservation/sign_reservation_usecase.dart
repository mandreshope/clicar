import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:clicar/app/domain/repositories/reservation/reservation_repository.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignReservationUseCase implements UseCase<Reservation, SignReservationParams> {
  final ReservationRepository repository;

  SignReservationUseCase({required this.repository});

  @override
  Future<Either<Failure, Reservation>> call(SignReservationParams params) async {
    return await repository.sign(signReservationParams: params);
  }
}

class SignReservationParams extends Equatable {
  final String numberReservation;
  final Signature signature;

  const SignReservationParams({
    required this.numberReservation,
    required this.signature,
  });

  @override
  List<Object> get props => [numberReservation, signature];

  Map<String, dynamic> toMap() {
    return {
      'numberReservation': numberReservation,
      'signature': signature.toMap(),
    };
  }
}