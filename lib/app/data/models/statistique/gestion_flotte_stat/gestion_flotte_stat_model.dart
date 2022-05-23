import 'package:clicar/app/domain/entities/statistique/gestion_flotte_stat/gestion_flotte_stat.dart';
import 'package:json_annotation/json_annotation.dart';


part 'gestion_flotte_stat_model.g.dart';

@JsonSerializable()
class GestionFlotteStatModel extends GestionFlotteStat {
  final int? nbLoue;
  final int? nbRendu;
  final int? vehiclDispo;
  final int? nbvehicleBooking;
  final int? totalVehicl;
  final int? nbPourcDispo;
  final int? nbPourcLoue;
  final String? pourcentageLoue;
  final String? inDispo;
  final String? pourcentageRendu;
  final String? pourcentageBooking;

  const GestionFlotteStatModel({
    this.nbLoue,
    this.nbRendu,
    this.vehiclDispo,
    this.nbvehicleBooking,
    this.totalVehicl,
    this.nbPourcDispo,
    this.nbPourcLoue,
    this.pourcentageLoue,
    this.inDispo,
    this.pourcentageRendu,
    this.pourcentageBooking,
  }) : super(
    nbLoue: nbLoue,
    nbRendu: nbRendu,
    vehiclDispo: vehiclDispo,
    nbvehicleBooking: nbvehicleBooking,
    totalVehicl: totalVehicl,
    nbPourcDispo: nbPourcDispo,
    nbPourcLoue: nbPourcLoue,
    pourcentageLoue: pourcentageLoue,
    inDispo: inDispo,
    pourcentageRendu: pourcentageRendu,
    pourcentageBooking: pourcentageBooking,
  );

  factory GestionFlotteStatModel.fromJson(Map<String, dynamic> json) =>
      _$GestionFlotteStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$GestionFlotteStatModelToJson(this);
}
