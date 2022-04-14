// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralModel _$GeneralModelFromJson(Map<String, dynamic> json) => GeneralModel(
      cases: json['case'] as String?,
      datelastKm: json['datelastKm'] as String?,
      keyDouble: json['keyDouble'] as String?,
      lastKm: json['lastKm'],
      geoloc: json['geoloc'] as String?,
      lastControlDate: json['lastControlDate'] as String?,
      entryDate: json['entryDate'] as String?,
      fuelType: json['fuelType'] as String?,
      fuelGauge: (json['fuelGauge'] as num?)?.toDouble(),
      gaugeDate: json['gaugeDate'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$GeneralModelToJson(GeneralModel instance) =>
    <String, dynamic>{
      'case': instance.cases,
      'datelastKm': instance.datelastKm,
      'keyDouble': instance.keyDouble,
      'lastKm': instance.lastKm,
      'geoloc': instance.geoloc,
      'lastControlDate': instance.lastControlDate,
      'entryDate': instance.entryDate,
      'fuelType': instance.fuelType,
      'fuelGauge': instance.fuelGauge,
      'gaugeDate': instance.gaugeDate,
      'category': instance.category,
    };
