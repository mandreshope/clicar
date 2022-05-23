// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFactModel _$UserFactModelFromJson(Map<String, dynamic> json) =>
    UserFactModel(
      id: json['id'] as String?,
      deleted: json['deleted'] as bool?,
      role: json['role'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      createdBy: json['createdBy'] as String?,
      categorie: json['categorie'] as String?,
      createdAt: json['createdAt'] as String?,
      v: json['v'] as int?,
      createdContracts: json['createdContracts'] as int?,
    );

Map<String, dynamic> _$UserFactModelToJson(UserFactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'deleted': instance.deleted,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'createdBy': instance.createdBy,
      'categorie': instance.categorie,
      'createdAt': instance.createdAt,
      'v': instance.v,
      'createdContracts': instance.createdContracts,
    };
