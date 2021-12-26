// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      id: json['id'] as String?,
      number: json['number'] as String?,
      name: json['name'] as String?,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'mail': instance.mail,
      'phone': instance.phone,
    };
