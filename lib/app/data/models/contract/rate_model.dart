import 'package:clicar/app/data/models/contract/rate_info_model.dart';
import 'package:clicar/app/data/models/contract/remise_model.dart';
import 'package:clicar/app/data/models/contract/rent_model.dart';
import 'package:clicar/app/data/models/contract/warranty_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'rate_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RateModel {
  String? id;
  List<RentModel>? rent;
  List<dynamic>? rentMajore;
  List<dynamic>? optionNonRestitution;
  List<dynamic>? options;
  List<WarrantyModel>? warranty;
  List<dynamic>? retourAnticipe;
  List<RemiseModel>? remise;
  RateInfoModel? info;

  RateModel({
    this.id,
    this.rent,
    this.rentMajore,
    this.optionNonRestitution,
    this.options,
    this.warranty,
    this.retourAnticipe,
    this.remise,
    this.info,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) =>
      _$RateModelFromJson(json);

  Map<String, dynamic> toJson() => _$RateModelToJson(this);
}
