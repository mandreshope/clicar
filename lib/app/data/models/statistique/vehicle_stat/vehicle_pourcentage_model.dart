import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_pourcentage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_pourcentage_model.g.dart';


@JsonSerializable()


class VehiclePourcentageModel extends VehiclePourcentage {
  final String? label;
  final String? color;
  final dynamic value;
  const VehiclePourcentageModel({
    this.label,
    this.color,
    this.value
  }):super(
    label: label,
    color: color,
    value: value
  );

  factory VehiclePourcentageModel.fromJson(Map<String, dynamic> json) =>
      _$VehiclePourcentageModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehiclePourcentageModelToJson(this);
}