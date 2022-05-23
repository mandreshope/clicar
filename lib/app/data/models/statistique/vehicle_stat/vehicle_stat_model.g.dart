// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleStatModel _$VehicleStatModelFromJson(Map<String, dynamic> json) =>
    VehicleStatModel(
      id: json['_id'] as String?,
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleStatModelToJson(VehicleStatModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'vehicles': instance.vehicles,
    };
