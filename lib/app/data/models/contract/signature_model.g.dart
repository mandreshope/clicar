// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignatureModel _$SignatureModelFromJson(Map<String, dynamic> json) =>
    SignatureModel(
      id: json['id'] as String?,
      signature: json['signature'] as String?,
      isAccepted: json['isAccepted'] as bool?,
    );

Map<String, dynamic> _$SignatureModelToJson(SignatureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'signature': instance.signature,
      'isAccepted': instance.isAccepted,
    };
