// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      role: json['role'] as String?,
      deleted: json['deleted'] as bool?,
      id: json['id'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'role': instance.role,
      'deleted': instance.deleted,
      'id': instance.id,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
    };
