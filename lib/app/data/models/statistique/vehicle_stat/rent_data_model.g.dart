// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentDataModel _$RentDataModelFromJson(Map<String, dynamic> json) =>
    RentDataModel(
      nbr: (json['nbr'] as List<dynamic>?)?.map((e) => e as int).toList(),
      poucentage: (json['poucentage'] as List<dynamic>?)
          ?.map((e) =>
              VehiclePourcentageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RentDataModelToJson(RentDataModel instance) =>
    <String, dynamic>{
      'nbr': instance.nbr,
      'poucentage': instance.poucentage,
    };
