

import 'package:clicar/app/domain/entities/sinistre/search_info_sinistre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_info_sinistre_model.g.dart';

@JsonSerializable(explicitToJson: true)

class SearchInfoSinistreModel extends SearchInfoSinistre {
  final String? numberContrat;
  final String? vehicleMark;
  final String? vehicleModel;
  final String? customerLastName;
  final String? customerFirstName;

  const SearchInfoSinistreModel({
    this.numberContrat,
    this.vehicleMark,
    this.vehicleModel,
    this.customerLastName,
    this.customerFirstName,
  }) : super(
    numberContrat: numberContrat,
    vehicleMark: vehicleMark,
    vehicleModel: vehicleModel,
    customerFirstName: customerLastName,
    customerLastName: customerLastName
  );

  factory SearchInfoSinistreModel.fromJson(Map<String, dynamic> json) =>
    _$SearchInfoSinistreModelFromJson(json);

    Map<String, dynamic> toJson() => _$SearchInfoSinistreModelToJson(this);

  
}