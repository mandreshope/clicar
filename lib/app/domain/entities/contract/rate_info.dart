import 'package:equatable/equatable.dart';

class RateInfo extends Equatable {
  final String? id;
  final String? ttc;
  final String? rent;
  final String? rentMajore;
  final String? optionNonRestitution;
  final String? warranty;
  final String? retourAnticipe;
  final String? rentToPay;
  final String? options;
  final String? remise;
  final String? sumReglement;
  final String? sumReglementWarranty;
  final String? sumReglementRetourAnticipe;
  final String? sumReglementRent;
  final String? sumReglementRentMajore;
  final String? sumReglementOptionNonRestitution;

  const RateInfo({
    this.id,
    this.ttc,
    this.rent,
    this.rentMajore,
    this.optionNonRestitution,
    this.warranty,
    this.retourAnticipe,
    this.rentToPay,
    this.options,
    this.remise,
    this.sumReglement,
    this.sumReglementWarranty,
    this.sumReglementRetourAnticipe,
    this.sumReglementRent,
    this.sumReglementRentMajore,
    this.sumReglementOptionNonRestitution,
  });

  @override
  List<Object?> get props => [
        id,
        ttc,
        rent,
        rentMajore,
        optionNonRestitution,
        warranty,
        retourAnticipe,
        rentToPay,
        options,
        remise,
        sumReglement,
        sumReglementWarranty,
        sumReglementRetourAnticipe,
        sumReglementRent,
        sumReglementRentMajore,
        sumReglementOptionNonRestitution,
      ];
}
