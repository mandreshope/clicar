import 'package:json_annotation/json_annotation.dart';
part 'rate_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RateInfoModel {
  RateInfoModel({
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

  String? id;
  String? ttc;
  String? rent;
  String? rentMajore;
  String? optionNonRestitution;
  String? warranty;
  String? retourAnticipe;
  String? rentToPay;
  String? options;
  String? remise;
  String? sumReglement;
  String? sumReglementWarranty;
  String? sumReglementRetourAnticipe;
  String? sumReglementRent;
  String? sumReglementRentMajore;
  String? sumReglementOptionNonRestitution;

  factory RateInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RateInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateInfoModelToJson(this);
}
