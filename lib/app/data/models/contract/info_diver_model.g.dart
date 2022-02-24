// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_diver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoDiverModel _$InfoDiverModelFromJson(Map<String, dynamic> json) =>
    InfoDiverModel(
      locationType: json['locationType'] as String?,
      contractTypeDetails: json['contractTypeDetails'] as String?,
      aValider: json['aValider'] as String?,
      contratInfo: json['contratInfo'] as String?,
      contrat: json['contrat'],
    );

Map<String, dynamic> _$InfoDiverModelToJson(InfoDiverModel instance) =>
    <String, dynamic>{
      'locationType': instance.locationType,
      'contractTypeDetails': instance.contractTypeDetails,
      'aValider': instance.aValider,
      'contratInfo': instance.contratInfo,
      'contrat': instance.contrat,
    };
