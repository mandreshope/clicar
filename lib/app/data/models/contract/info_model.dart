import 'package:clicar/app/domain/entities/contract/info.dart';
import 'package:json_annotation/json_annotation.dart';
part 'info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractInfoModel extends ContractInfo {
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

  const ContractInfoModel({
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
  }) : super(
          isReservation: isReservation,
          isAnticipe: isAnticipe,
          id: id,
          departureDate: departureDate,
          departureAgency: departureAgency,
          returnDate: returnDate,
          returnAgency: returnAgency,
          anticipeReturnDate: anticipeReturnDate,
          aniticipeReturnMotif: aniticipeReturnMotif,
          depositAmount: depositAmount,
          option: option,
          payementModality: payementModality,
          basePrice: basePrice,
          kmReturn: kmReturn,
          paymentFees: paymentFees,
          commercial: commercial,
          fuelReturn: fuelReturn,
          kmInclus: kmInclus,
          remise: remise,
        );

  factory ContractInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ContractInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractInfoModelToJson(this);
}
