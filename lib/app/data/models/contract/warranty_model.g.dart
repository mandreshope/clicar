// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantyModel _$WarrantyModelFromJson(Map<String, dynamic> json) =>
    WarrantyModel(
      id_: json['_id'] as String?,
      amount: json['amount'] as String?,
      id: json['id'] as int?,
      payementType: json['payementType'] as String?,
      commercial: json['commercial'] as String?,
      payementMode: json['payementMode'] as String?,
      payementModality: json['payementModality'] as String?,
      echeanceBegin: json['echeanceBegin'] as String?,
      echeanceEnd: json['echeanceEnd'] as String?,
      echeanceDay: json['echeanceDay'] as String?,
    );

Map<String, dynamic> _$WarrantyModelToJson(WarrantyModel instance) =>
    <String, dynamic>{
      '_id': instance.id_,
      'amount': instance.amount,
      'id': instance.id,
      'payementType': instance.payementType,
      'commercial': instance.commercial,
      'payementMode': instance.payementMode,
      'payementModality': instance.payementModality,
      'echeanceBegin': instance.echeanceBegin,
      'echeanceEnd': instance.echeanceEnd,
      'echeanceDay': instance.echeanceDay,
    };
