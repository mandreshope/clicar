import 'package:equatable/equatable.dart';

class ContractInfo extends Equatable {
  final bool? isReservation;
  final bool? isAnticipe;
  final String? id;
  final String? departureDate;
  final String? departureAgency;
  final String? returnDate;
  final String? returnAgency;
  final dynamic anticipeReturnDate;
  final String? aniticipeReturnMotif;
  final String? depositAmount;
  final String? option;
  final String? payementModality;
  final String? basePrice;
  final String? kmReturn;
  final String? paymentFees;
  final String? commercial;
  final String? fuelReturn;
  final String? kmInclus;
  final String? remise;

  const ContractInfo({
    this.isReservation,
    this.isAnticipe,
    this.id,
    this.departureDate,
    this.departureAgency,
    this.returnDate,
    this.returnAgency,
    this.anticipeReturnDate,
    this.aniticipeReturnMotif,
    this.depositAmount,
    this.option,
    this.payementModality,
    this.basePrice,
    this.kmReturn,
    this.paymentFees,
    this.commercial,
    this.fuelReturn,
    this.kmInclus,
    this.remise,
  });

  @override
  List<Object?> get props => [
        isReservation,
        isAnticipe,
        id,
        departureDate,
        departureAgency,
        returnDate,
        returnAgency,
        anticipeReturnDate,
        aniticipeReturnMotif,
        depositAmount,
        option,
        payementModality,
        basePrice,
        kmReturn,
        paymentFees,
        commercial,
        fuelReturn,
        kmInclus,
        remise,
      ];
}
