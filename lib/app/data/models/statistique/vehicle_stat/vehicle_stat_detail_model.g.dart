// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_stat_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleStatDetailModel _$VehicleStatDetailModelFromJson(
        Map<String, dynamic> json) =>
    VehicleStatDetailModel(
      chiffreAffaire: json['chiffreAffaire'] as int?,
      pourentage: json['pourentage'] as String?,
      loyerMoyern: json['loyerMoyern'] == null
          ? null
          : RentAverageModel.fromJson(
              json['loyerMoyern'] as Map<String, dynamic>),
      jour: json['jour'] as int?,
    );

Map<String, dynamic> _$VehicleStatDetailModelToJson(
        VehicleStatDetailModel instance) =>
    <String, dynamic>{
      'chiffreAffaire': instance.chiffreAffaire,
      'pourentage': instance.pourentage,
      'loyerMoyern': instance.loyerMoyern,
      'jour': instance.jour,
    };
