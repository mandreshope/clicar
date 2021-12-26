import 'package:json_annotation/json_annotation.dart';
part 'info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractInfoModel {
  bool? isReservation;
  bool? isAnticipe;
  String? id;
  String? departureDate;
  String? departureAgency;
  String? returnDate;
  String? returnAgency;
  dynamic anticipeReturnDate;
  String? aniticipeReturnMotif;
  String? depositAmount;
  String? option;
  String? payementModality;
  String? basePrice;
  String? kmReturn;
  String? paymentFees;
  String? commercial;
  String? fuelReturn;
  String? kmInclus;
  String? remise;

  ContractInfoModel({
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

  factory ContractInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ContractInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractInfoModelToJson(this);
}
