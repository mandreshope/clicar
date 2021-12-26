import 'package:clicar/app/domain/entities/contract/rate_info.dart';
import 'package:json_annotation/json_annotation.dart';
part 'rate_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RateInfoModel extends RateInfo {
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

  const RateInfoModel({
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
  }) : super(
          id: id,
          ttc: ttc,
          rent: rent,
          rentMajore: rentMajore,
          optionNonRestitution: optionNonRestitution,
          warranty: warranty,
          retourAnticipe: retourAnticipe,
          rentToPay: rentToPay,
          options: options,
          remise: remise,
          sumReglement: sumReglement,
          sumReglementWarranty: sumReglementWarranty,
          sumReglementRetourAnticipe: sumReglementRetourAnticipe,
          sumReglementRent: sumReglementRent,
          sumReglementRentMajore: sumReglementRentMajore,
          sumReglementOptionNonRestitution: sumReglementOptionNonRestitution,
        );

  factory RateInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RateInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateInfoModelToJson(this);
}
