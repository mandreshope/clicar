// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_at_end_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionAtEndModel _$ConditionAtEndModelFromJson(Map<String, dynamic> json) =>
    ConditionAtEndModel(
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      faults:
          (json['faults'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      conditionDate: json['conditionDate'] as String?,
      comment: json['comment'] as String?,
      km: json['km'] as int?,
      fuelQuantity: json['fuelQuantity'] as int?,
    );

Map<String, dynamic> _$ConditionAtEndModelToJson(
        ConditionAtEndModel instance) =>
    <String, dynamic>{
      'conditions': instance.conditions,
      'faults': instance.faults,
      'id': instance.id,
      'conditionDate': instance.conditionDate,
      'comment': instance.comment,
      'km': instance.km,
      'fuelQuantity': instance.fuelQuantity,
    };
