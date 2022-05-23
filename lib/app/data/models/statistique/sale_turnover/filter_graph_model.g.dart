// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_graph_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterGraphModel _$FilterGraphModelFromJson(Map<String, dynamic> json) =>
    FilterGraphModel(
      grapAmountToPay: (json['GrapAmountToPay'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      grapAmount:
          (json['GrapAmount'] as List<dynamic>?)?.map((e) => e as int).toList(),
      mothSelected: (json['MothSelected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FilterGraphModelToJson(FilterGraphModel instance) =>
    <String, dynamic>{
      'GrapAmountToPay': instance.grapAmountToPay,
      'GrapAmount': instance.grapAmount,
      'MothSelected': instance.mothSelected,
    };
