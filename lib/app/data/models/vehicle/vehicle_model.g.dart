// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: json['id'] as String?,
      immos: json['immos'] as List<dynamic>?,
      maintenances: json['maintenances'] as List<dynamic>?,
      pvs: json['pvs'] as List<dynamic>?,
      deleted: json['deleted'] as bool?,
      contrats: (json['contrats'] as List<dynamic>?)
          ?.map((e) => e is String
              ? ContractModel.fromJson({})
              : ContractModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: json['locations'] as List<dynamic>?,
      number: json['number'] as String?,
      immat1: json['immat1'] as String?,
      immat2: json['immat2'] as String?,
      serialNumber: json['serialNumber'] as String?,
      mark: json['mark'] as String?,
      modele: json['modele'] as String?,
      state: json['state'] as String?,
      general: json['general'] == null
          ? null
          : GeneralModel.fromJson(json['general'] as Map<String, dynamic>),
      options: json['options'] == null
          ? null
          : OptionsModel.fromJson(json['options'] as Map<String, dynamic>),
      purchase: json['purchase'] == null
          ? null
          : PurchaseModel.fromJson(json['purchase'] as Map<String, dynamic>),
      registration: json['registration'] == null
          ? null
          : RegistrationModel.fromJson(
              json['registration'] as Map<String, dynamic>),
      sale: json['sale'] == null
          ? null
          : SaleModel.fromJson(json['sale'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : InsuranceModel.fromJson(json['insurance'] as Map<String, dynamic>),
      documents: json['documents'],
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'immos': instance.immos,
      'maintenances': instance.maintenances,
      'pvs': instance.pvs,
      'deleted': instance.deleted,
      'contrats': instance.contrats?.map((e) => e.toJson()).toList(),
      'locations': instance.locations,
      'number': instance.number,
      'immat1': instance.immat1,
      'immat2': instance.immat2,
      'serialNumber': instance.serialNumber,
      'mark': instance.mark,
      'modele': instance.modele,
      'state': instance.state,
      'general': instance.general?.toJson(),
      'options': instance.options?.toJson(),
      'purchase': instance.purchase?.toJson(),
      'registration': instance.registration?.toJson(),
      'sale': instance.sale?.toJson(),
      'insurance': instance.insurance?.toJson(),
      'documents': instance.documents,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'v': instance.v,
    };
