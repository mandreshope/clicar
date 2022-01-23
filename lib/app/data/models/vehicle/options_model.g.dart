// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionsModel _$OptionsModelFromJson(Map<String, dynamic> json) => OptionsModel(
      gearBox: json['gearBox'] as String?,
      color: json['color'] as String?,
      options: json['options'] as List<dynamic>?,
      equipments: json['equipments'] as List<dynamic>?,
      category: json['category'] as String?,
      motor: json['motor'] as int?,
      additionalKmUnitPrice:
          (json['additionalKmUnitPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OptionsModelToJson(OptionsModel instance) =>
    <String, dynamic>{
      'gearBox': instance.gearBox,
      'color': instance.color,
      'options': instance.options,
      'equipments': instance.equipments,
      'category': instance.category,
      'motor': instance.motor,
      'additionalKmUnitPrice': instance.additionalKmUnitPrice,
    };
