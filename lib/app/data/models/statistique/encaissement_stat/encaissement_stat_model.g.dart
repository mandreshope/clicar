// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encaissement_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncaissementStatModel _$EncaissementStatModelFromJson(
        Map<String, dynamic> json) =>
    EncaissementStatModel(
      retardPayingInClosedAmount: json['retardPayingInClosedAmount'] as int?,
      montantTotalClosed: json['montantTotalClosed'] as int?,
      calculPoucentageretardPayingInClosedAmount:
          json['calculPoucentageretardPayingInClosedAmount'] as String?,
      mothSelected: (json['mothSelected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EncaissementStatModelToJson(
        EncaissementStatModel instance) =>
    <String, dynamic>{
      'retardPayingInClosedAmount': instance.retardPayingInClosedAmount,
      'montantTotalClosed': instance.montantTotalClosed,
      'calculPoucentageretardPayingInClosedAmount':
          instance.calculPoucentageretardPayingInClosedAmount,
      'mothSelected': instance.mothSelected,
    };
