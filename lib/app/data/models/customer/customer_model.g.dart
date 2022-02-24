// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: json['id'] as String?,
      dateUpdate: json['dateUpdate'],
      dateDelete: json['dateDelete'],
      deleteby: json['deleteby'],
      deleted: json['deleted'] as int?,
      typeCustomer: json['typeCustomer'] as String?,
      civility: json['civility'] as String?,
      companyName: json['companyName'] as String?,
      typeOfClient: json['typeOfClient'] as String?,
      knowSociety: json['knowSociety'] as String?,
      other: json['other'] as String?,
      adresse1: json['adresse1'] as String?,
      adresse2: json['adresse2'] as String?,
      codePostal: json['codePostal'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      complement: json['complement'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateofBirth: json['dateofBirth'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      numberPhonePro: json['numberPhonePro'] as String?,
      numberPhone: json['numberPhone'] as String?,
      mail: json['mail'] as String?,
      documents: json['documents'],
      createBy: json['createBy'] as String?,
      numberCustomer: json['numberCustomer'] as String?,
      dateCreated: json['dateCreated'] as String?,
      v: json['v'] as int?,
      customerFirstName: json['customerFirstName'] as String?,
      customerLastName: json['customerLastName'] as String?,
      updatedBy: json['updatedBy'],
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateUpdate': instance.dateUpdate,
      'dateDelete': instance.dateDelete,
      'deleteby': instance.deleteby,
      'deleted': instance.deleted,
      'typeCustomer': instance.typeCustomer,
      'civility': instance.civility,
      'companyName': instance.companyName,
      'typeOfClient': instance.typeOfClient,
      'knowSociety': instance.knowSociety,
      'other': instance.other,
      'adresse1': instance.adresse1,
      'adresse2': instance.adresse2,
      'codePostal': instance.codePostal,
      'country': instance.country,
      'city': instance.city,
      'complement': instance.complement,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateofBirth': instance.dateofBirth,
      'placeOfBirth': instance.placeOfBirth,
      'numberPhonePro': instance.numberPhonePro,
      'numberPhone': instance.numberPhone,
      'mail': instance.mail,
      'documents': instance.documents,
      'createBy': instance.createBy,
      'numberCustomer': instance.numberCustomer,
      'dateCreated': instance.dateCreated,
      'v': instance.v,
      'customerFirstName': instance.customerFirstName,
      'customerLastName': instance.customerLastName,
      'updatedBy': instance.updatedBy,
    };
