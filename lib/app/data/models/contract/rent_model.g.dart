// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentModel _$RentModelFromJson(Map<String, dynamic> json) => RentModel(
      isInsurance: json['isInsurance'] as bool?,
      id_: json['_id'] as String?,
      amount: json['amount'] as String?,
      id: json['id'] as int?,
      unitPrice: json['unitPrice'] as String?,
      commercial: json['commercial'] as String?,
      locationType: json['locationType'] as String?,
      payementType: json['payementType'] as String?,
      duration: json['duration'] as String?,
      echeanceBegin: json['echeanceBegin'] as String?,
      echeanceEnd: json['echeanceEnd'] as String?,
      echeanceDay: json['echeanceDay'] as String?,
      payementMode: json['payementMode'] as String?,
      kmInclus: json['kmInclus'] as String?,
    );

Map<String, dynamic> _$RentModelToJson(RentModel instance) => <String, dynamic>{
      'isInsurance': instance.isInsurance,
      '_id': instance.id_,
      'amount': instance.amount,
      'id': instance.id,
      'unitPrice': instance.unitPrice,
      'commercial': instance.commercial,
      'locationType': instance.locationType,
      'payementType': instance.payementType,
      'duration': instance.duration,
      'echeanceBegin': instance.echeanceBegin,
      'echeanceEnd': instance.echeanceEnd,
      'echeanceDay': instance.echeanceDay,
      'payementMode': instance.payementMode,
      'kmInclus': instance.kmInclus,
    };
