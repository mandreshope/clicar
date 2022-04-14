import 'package:clicar/app/domain/entities/vehicle/general.dart';
import 'package:json_annotation/json_annotation.dart';
part 'general_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GeneralModel extends General {
  @JsonKey(name: "case")
  final String? cases;
  final String? datelastKm;
  final String? keyDouble;
  final dynamic lastKm;
  final String? geoloc;
  final String? lastControlDate;
  final String? entryDate;
  final String? fuelType;
  final double? fuelGauge;
  final String? gaugeDate;
  final String? category;

  const GeneralModel({
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
  }) : super(
          cases: cases,
          datelastKm: datelastKm,
          keyDouble: keyDouble,
          lastKm: lastKm,
          geoloc: geoloc,
          lastControlDate: lastControlDate,
          entryDate: entryDate,
          fuelType: fuelType,
          fuelGauge: fuelGauge,
          gaugeDate: gaugeDate,
          category: category,
        );

  factory GeneralModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralModelToJson(this);
}
