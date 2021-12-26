import 'package:json_annotation/json_annotation.dart';
part 'general_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GeneralModel {
  @JsonKey(name: "case")
  String? cases;
  String? datelastKm;
  String? keyDouble;
  String? lastKm;
  String? geoloc;
  String? lastControlDate;
  String? entryDate;
  String? fuelType;
  int? fuelGauge;
  String? gaugeDate;
  String? category;

  GeneralModel({
    this.cases,
    this.datelastKm,
    this.keyDouble,
    this.lastKm,
    this.geoloc,
    this.lastControlDate,
    this.entryDate,
    this.fuelType,
    this.fuelGauge,
    this.gaugeDate,
    this.category,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralModelToJson(this);
}
