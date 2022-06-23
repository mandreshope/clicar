import 'package:clicar/app/data/models/statistique/vehicle_stat/vehicle_pourcentage_model.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/rent_data.dart';
import 'package:json_annotation/json_annotation.dart';


part 'rent_data_model.g.dart';

@JsonSerializable()


class RentDataModel extends RentData {
  final List<int>? nbr;
  final List<VehiclePourcentageModel>? poucentage;
  const RentDataModel({
    this.nbr,
    this.poucentage,
  }):super(
    nbr: nbr,
    poucentage: poucentage,
  );

  factory RentDataModel.fromJson(Map<String, dynamic> json) =>
      _$RentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentDataModelToJson(this);
}