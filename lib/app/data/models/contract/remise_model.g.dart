// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemiseModel _$RemiseModelFromJson(Map<String, dynamic> json) => RemiseModel(
      echeanceToApplicate: (json['echeanceToApplicate'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id_: json['id_'] as String?,
      id: json['id'] as int?,
      commercial: json['commercial'] as String?,
      motif: json['motif'] as String?,
      amount: json['amount'] as String?,
      remiseBegin: json['remiseBegin'] as String?,
      remiseEnd: json['remiseEnd'] as String?,
      aValider: json['aValider'] as String?,
    );

Map<String, dynamic> _$RemiseModelToJson(RemiseModel instance) =>
    <String, dynamic>{
      'echeanceToApplicate': instance.echeanceToApplicate,
      'id_': instance.id_,
      'id': instance.id,
      'commercial': instance.commercial,
      'motif': instance.motif,
      'amount': instance.amount,
      'remiseBegin': instance.remiseBegin,
      'remiseEnd': instance.remiseEnd,
      'aValider': instance.aValider,
    };
