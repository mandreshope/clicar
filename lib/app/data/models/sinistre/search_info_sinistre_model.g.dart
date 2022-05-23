// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_info_sinistre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchInfoSinistreModel _$SearchInfoSinistreModelFromJson(
        Map<String, dynamic> json) =>
    SearchInfoSinistreModel(
      numberContrat: json['numberContrat'] as String?,
      vehicleMark: json['vehicleMark'] as String?,
      vehicleModel: json['vehicleModel'] as String?,
      customerLastName: json['customerLastName'] as String?,
      customerFirstName: json['customerFirstName'] as String?,
    );

Map<String, dynamic> _$SearchInfoSinistreModelToJson(
        SearchInfoSinistreModel instance) =>
    <String, dynamic>{
      'numberContrat': instance.numberContrat,
      'vehicleMark': instance.vehicleMark,
      'vehicleModel': instance.vehicleModel,
      'customerLastName': instance.customerLastName,
      'customerFirstName': instance.customerFirstName,
    };
