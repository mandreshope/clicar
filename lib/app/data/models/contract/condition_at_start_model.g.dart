// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_at_start_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionAtStartModel _$ConditionAtStartModelFromJson(
        Map<String, dynamic> json) =>
    ConditionAtStartModel(
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      faults:
          (json['faults'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['_id'] as String?,
      conditionDate: json['conditionDate'] as String?,
      comment: json['comment'] as String?,
      km: json['km'] as int?,
      fuelQuantity: json['fuelQuantity'] as int?,
      signature: json['signature'] as String?,
      signatureDate: json['signatureDate'] as String?,
    );

Map<String, dynamic> _$ConditionAtStartModelToJson(
        ConditionAtStartModel instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'faults': instance.faults,
      '_id': instance.id,
      'conditionDate': instance.conditionDate,
      'comment': instance.comment,
      'km': instance.km,
      'fuelQuantity': instance.fuelQuantity,
      'signature': instance.signature,
      'signatureDate': instance.signatureDate,
    };
