import 'package:clicar/app/data/models/statistique/vehicle_stat/rent_data_model.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/rent_%20average.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_average_model.g.dart';

@JsonSerializable()
class RentAverageModel extends RentAverage {
  final RentDataModel? mensuel;
  final RentDataModel? hebdomadaire;
  const RentAverageModel({
    this.mensuel,
    this.hebdomadaire,
  }) : super(
          mensuel: mensuel,
          hebdomadaire: hebdomadaire,
        );

  factory RentAverageModel.fromJson(Map<String, dynamic> json) =>
      _$RentAverageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentAverageModelToJson(this);
}
