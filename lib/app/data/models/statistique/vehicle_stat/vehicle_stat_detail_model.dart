import 'package:clicar/app/data/models/statistique/vehicle_stat/rent_average_model.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat_detail.dart';
import 'package:json_annotation/json_annotation.dart';


part 'vehicle_stat_detail_model.g.dart';

@JsonSerializable()


class VehicleStatDetailModel extends VehicleStatDetail {
  final int? chiffreAffaire;
  final String? pourentage;
  final RentAverageModel? loyerMoyern;
  final int? jour;
  const VehicleStatDetailModel({
    this.chiffreAffaire,
    this.pourentage,
    this.loyerMoyern,
    this.jour
  }):super(
    chiffreAffaire: chiffreAffaire,
    pourentage: pourentage,
    loyerMoyern: loyerMoyern,
    jour: jour
  );

  factory VehicleStatDetailModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleStatDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleStatDetailModelToJson(this);
}