// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel(
      id: json['id'] as String?,
      deleted: json['deleted'] as bool?,
      customer: json['customer'] == null
          ? null
          : json['customer'] is String
              ? CustomerModel.fromJson({})
              : CustomerModel.fromJson(
                  json['customer'] as Map<String, dynamic>),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      youngName: json['youngName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      portable: json['portable'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      complement: json['complement'] as String?,
      country: json['country'] as String?,
      permisNumber: json['permisNumber'] as String?,
      permisDelivery: json['permisDelivery'] as String?,
      permisPrefecture: json['permisPrefecture'] as String?,
      ciOrPassportNumber: json['ciOrPassportNumber'] as String?,
      ciOrPassportNumberDelivery: json['ciOrPassportNumberDelivery'] as String?,
      ciOrPassportNumberPrefecture:
          json['ciOrPassportNumberPrefecture'] as String?,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as String?,
      driverNumber: json['driverNumber'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'customer': instance.customer?.toJson(),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'youngName': instance.youngName,
      'dateOfBirth': instance.dateOfBirth,
      'placeOfBirth': instance.placeOfBirth,
      'phoneNumber': instance.phoneNumber,
      'portable': instance.portable,
      'email': instance.email,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'complement': instance.complement,
      'country': instance.country,
      'permisNumber': instance.permisNumber,
      'permisDelivery': instance.permisDelivery,
      'permisPrefecture': instance.permisPrefecture,
      'ciOrPassportNumber': instance.ciOrPassportNumber,
      'ciOrPassportNumberDelivery': instance.ciOrPassportNumberDelivery,
      'ciOrPassportNumberPrefecture': instance.ciOrPassportNumberPrefecture,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'driverNumber': instance.driverNumber,
      'v': instance.v,
    };
