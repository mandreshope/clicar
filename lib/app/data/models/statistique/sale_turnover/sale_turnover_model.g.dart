// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_turnover_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleTurnoverModel _$SaleTurnoverModelFromJson(Map<String, dynamic> json) =>
    SaleTurnoverModel(
      amount: json['amount'] as int?,
      retardPaying: json['retardPaying'] as int?,
      waranty: json['waranty'] as int?,
      amountToPay: json['amountToPay'] as int?,
      totalContravention: json['totalContravention'] as int?,
      objectif: json['objectif'] as int?,
      grapAmountToPay: (json['GrapAmountToPay'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      grapAmount:
          (json['GrapAmount'] as List<dynamic>?)?.map((e) => e as int).toList(),
      mothSelected: (json['MothSelected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      calculPourentageAmountToPay:
          json['calculPourentageAmountToPay'] as String?,
      calculPourentageAmount: json['calculPourentageAmount'] as String?,
      retardEncaissement: json['retardEncaissement'] as String?,
      pourcentageRetardEncaissement:
          json['pourcentageRetardEncaissement'] as String?,
      usersFact: (json['usersFact'] as List<dynamic>?)
          ?.map((e) => UserFactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleTurnoverModelToJson(SaleTurnoverModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'retardPaying': instance.retardPaying,
      'waranty': instance.waranty,
      'amountToPay': instance.amountToPay,
      'totalContravention': instance.totalContravention,
      'objectif': instance.objectif,
      'GrapAmountToPay': instance.grapAmountToPay,
      'GrapAmount': instance.grapAmount,
      'MothSelected': instance.mothSelected,
      'calculPourentageAmountToPay': instance.calculPourentageAmountToPay,
      'calculPourentageAmount': instance.calculPourentageAmount,
      'retardEncaissement': instance.retardEncaissement,
      'pourcentageRetardEncaissement': instance.pourcentageRetardEncaissement,
      'usersFact': instance.usersFact,
    };
