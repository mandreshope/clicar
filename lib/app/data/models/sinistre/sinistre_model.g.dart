// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sinistre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SinistreModel _$SinistreModelFromJson(Map<String, dynamic> json) =>
    SinistreModel(
      id: json['id'] as String?,
      numeroSinistre: json['numeroSinistre'] as String?,
      contrat: json['contrat'] as String?,
      returnDate: json['returnDate'] as String?,
      commentClicar: json['commentClicar'] as String?,
      search: json['search'] == null
          ? null
          : SearchInfoSinistreModel.fromJson(
              json['search'] as Map<String, dynamic>),
      deleted: json['deleted'] as bool?,
      createdBy: json['createdBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      deletedBy: json['deletedBy'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      transform: json['transform'],
    );

Map<String, dynamic> _$SinistreModelToJson(SinistreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numeroSinistre': instance.numeroSinistre,
      'contrat': instance.contrat,
      'returnDate': instance.returnDate,
      'commentClicar': instance.commentClicar,
      'search': instance.search?.toJson(),
      'deleted': instance.deleted,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'transform': instance.transform,
    };
