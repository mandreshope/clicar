// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) =>
    RegistrationModel(
      immat1: json['immat1'] as String?,
      serialNumber: json['serialNumber'] as String?,
      placeNumber: json['placeNumber'] as String?,
      doorNumber: json['doorNumber'] as String?,
      certificatePrice: json['certificatePrice'] as String?,
      cvNumber: json['cvNumber'] as String?,
      fuelType: json['fuelType'] as String?,
      vehicleKind: json['vehicleKind'] as String?,
      vehicleType: json['vehicleType'] as String?,
      immat1Date: json['immat1Date'] as String?,
      immatCertificateDate: json['immatCertificateDate'] as String?,
    );

Map<String, dynamic> _$RegistrationModelToJson(RegistrationModel instance) =>
    <String, dynamic>{
      'immat1': instance.immat1,
      'serialNumber': instance.serialNumber,
      'placeNumber': instance.placeNumber,
      'doorNumber': instance.doorNumber,
      'certificatePrice': instance.certificatePrice,
      'cvNumber': instance.cvNumber,
      'fuelType': instance.fuelType,
      'vehicleKind': instance.vehicleKind,
      'vehicleType': instance.vehicleType,
      'immat1Date': instance.immat1Date,
      'immatCertificateDate': instance.immatCertificateDate,
    };
