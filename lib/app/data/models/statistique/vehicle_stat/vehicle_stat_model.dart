import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_stat_model.g.dart';

@JsonSerializable()
class VehicleStatModel extends VehicleStat {
  @JsonKey(name: '_id')
  final String? id;
  final List<VehicleModel>? vehicles;
  const VehicleStatModel({
    this.id,
    this.vehicles,
  });

  factory VehicleStatModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleStatModelToJson(this);
}