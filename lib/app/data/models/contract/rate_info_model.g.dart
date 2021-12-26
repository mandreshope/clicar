// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateInfoModel _$RateInfoModelFromJson(Map<String, dynamic> json) =>
    RateInfoModel(
      id: json['id'] as String?,
      ttc: json['ttc'] as String?,
      rent: json['rent'] as String?,
      rentMajore: json['rentMajore'] as String?,
      optionNonRestitution: json['optionNonRestitution'] as String?,
      warranty: json['warranty'] as String?,
      retourAnticipe: json['retourAnticipe'] as String?,
      rentToPay: json['rentToPay'] as String?,
      options: json['options'] as String?,
      remise: json['remise'] as String?,
      sumReglement: json['sumReglement'] as String?,
      sumReglementWarranty: json['sumReglementWarranty'] as String?,
      sumReglementRetourAnticipe: json['sumReglementRetourAnticipe'] as String?,
      sumReglementRent: json['sumReglementRent'] as String?,
      sumReglementRentMajore: json['sumReglementRentMajore'] as String?,
      sumReglementOptionNonRestitution:
          json['sumReglementOptionNonRestitution'] as String?,
    );

Map<String, dynamic> _$RateInfoModelToJson(RateInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ttc': instance.ttc,
      'rent': instance.rent,
      'rentMajore': instance.rentMajore,
      'optionNonRestitution': instance.optionNonRestitution,
      'warranty': instance.warranty,
      'retourAnticipe': instance.retourAnticipe,
      'rentToPay': instance.rentToPay,
      'options': instance.options,
      'remise': instance.remise,
      'sumReglement': instance.sumReglement,
      'sumReglementWarranty': instance.sumReglementWarranty,
      'sumReglementRetourAnticipe': instance.sumReglementRetourAnticipe,
      'sumReglementRent': instance.sumReglementRent,
      'sumReglementRentMajore': instance.sumReglementRentMajore,
      'sumReglementOptionNonRestitution':
          instance.sumReglementOptionNonRestitution,
    };
