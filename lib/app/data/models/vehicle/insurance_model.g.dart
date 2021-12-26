// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceModel _$InsuranceModelFromJson(Map<String, dynamic> json) =>
    InsuranceModel(
      handledByClient: json['handledByClient'] as String?,
      insurer: json['insurer'] as String?,
      optionalInsurance: json['optionalInsurance'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$InsuranceModelToJson(InsuranceModel instance) =>
    <String, dynamic>{
      'handledByClient': instance.handledByClient,
      'insurer': instance.insurer,
      'optionalInsurance': instance.optionalInsurance,
      'type': instance.type,
    };
