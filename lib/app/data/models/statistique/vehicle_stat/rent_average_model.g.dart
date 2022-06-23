// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_average_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentAverageModel _$RentAverageModelFromJson(Map<String, dynamic> json) =>
    RentAverageModel(
      mensuel: json['mensuel'] == null
          ? null
          : RentDataModel.fromJson(json['mensuel'] as Map<String, dynamic>),
      hebdomadaire: json['hebdomadaire'] == null
          ? null
          : RentDataModel.fromJson(
              json['hebdomadaire'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RentAverageModelToJson(RentAverageModel instance) =>
    <String, dynamic>{
      'mensuel': instance.mensuel,
      'hebdomadaire': instance.hebdomadaire,
    };
