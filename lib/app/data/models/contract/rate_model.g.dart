// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateModel _$RateModelFromJson(Map<String, dynamic> json) => RateModel(
      id: json['id'] as String?,
      rent: (json['rent'] as List<dynamic>?)
          ?.map((e) => RentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rentMajore: json['rentMajore'] as List<dynamic>?,
      optionNonRestitution: json['optionNonRestitution'] as List<dynamic>?,
      options: json['options'] as List<dynamic>?,
      warranty: (json['warranty'] as List<dynamic>?)
          ?.map((e) => WarrantyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      retourAnticipe: json['retourAnticipe'] as List<dynamic>?,
      remise: (json['remise'] as List<dynamic>?)
          ?.map((e) => RemiseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: json['info'] == null
          ? null
          : RateInfoModel.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateModelToJson(RateModel instance) => <String, dynamic>{
      'id': instance.id,
      'rent': instance.rent?.map((e) => e.toJson()).toList(),
      'rentMajore': instance.rentMajore,
      'optionNonRestitution': instance.optionNonRestitution,
      'options': instance.options,
      'warranty': instance.warranty?.map((e) => e.toJson()).toList(),
      'retourAnticipe': instance.retourAnticipe,
      'remise': instance.remise?.map((e) => e.toJson()).toList(),
      'info': instance.info?.toJson(),
    };
