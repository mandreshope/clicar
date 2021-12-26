import 'package:clicar/app/data/models/contract/rate_info_model.dart';
import 'package:clicar/app/data/models/contract/remise_model.dart';
import 'package:clicar/app/data/models/contract/rent_model.dart';
import 'package:clicar/app/data/models/contract/warranty_model.dart';
import 'package:clicar/app/domain/entities/contract/rate.dart';

import 'package:json_annotation/json_annotation.dart';
part 'rate_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RateModel extends Rate {
  final String? id;
  final List<RentModel>? rent;
  final List<dynamic>? rentMajore;
  final List<dynamic>? optionNonRestitution;
  final List<dynamic>? options;
  final List<WarrantyModel>? warranty;
  final List<dynamic>? retourAnticipe;
  final List<RemiseModel>? remise;
  final RateInfoModel? info;

  const RateModel({
    this.id,
    this.rent,
    this.rentMajore,
    this.optionNonRestitution,
    this.options,
    this.warranty,
    this.retourAnticipe,
    this.remise,
    this.info,
  }) : super(
          id: id,
          rent: rent,
          rentMajore: rentMajore,
          optionNonRestitution: optionNonRestitution,
          options: options,
          warranty: warranty,
          retourAnticipe: retourAnticipe,
          remise: remise,
          info: info,
        );

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateModelToJson(this);
}
