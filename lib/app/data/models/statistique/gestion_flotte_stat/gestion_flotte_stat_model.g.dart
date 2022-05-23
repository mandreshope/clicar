// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestion_flotte_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GestionFlotteStatModel _$GestionFlotteStatModelFromJson(
        Map<String, dynamic> json) =>
    GestionFlotteStatModel(
      nbLoue: json['nbLoue'] as int?,
      nbRendu: json['nbRendu'] as int?,
      vehiclDispo: json['vehiclDispo'] as int?,
      nbvehicleBooking: json['nbvehicleBooking'] as int?,
      totalVehicl: json['totalVehicl'] as int?,
      nbPourcDispo: json['nbPourcDispo'] as int?,
      nbPourcLoue: json['nbPourcLoue'] as int?,
      pourcentageLoue: json['pourcentageLoue'] as String?,
      inDispo: json['inDispo'] as String?,
      pourcentageRendu: json['pourcentageRendu'] as String?,
      pourcentageBooking: json['pourcentageBooking'] as String?,
    );

Map<String, dynamic> _$GestionFlotteStatModelToJson(
        GestionFlotteStatModel instance) =>
    <String, dynamic>{
      'nbLoue': instance.nbLoue,
      'nbRendu': instance.nbRendu,
      'vehiclDispo': instance.vehiclDispo,
      'nbvehicleBooking': instance.nbvehicleBooking,
      'totalVehicl': instance.totalVehicl,
      'nbPourcDispo': instance.nbPourcDispo,
      'nbPourcLoue': instance.nbPourcLoue,
      'pourcentageLoue': instance.pourcentageLoue,
      'inDispo': instance.inDispo,
      'pourcentageRendu': instance.pourcentageRendu,
      'pourcentageBooking': instance.pourcentageBooking,
    };
