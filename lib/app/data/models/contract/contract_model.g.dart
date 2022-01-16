// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractModel _$ContractModelFromJson(Map<String, dynamic> json) =>
    ContractModel(
      id: json['id'] as String?,
      note: json['note'] as String?,
      comment: json['comment'] as String?,
      deleted: json['deleted'] as bool?,
      status: json['status'] as int?,
      isVehicleReturn: json['isVehicleReturn'] as bool?,
      isBooking: json['isBooking'] as bool?,
      blockTarif: json['blockTarif'] as bool?,
      dontWarrantyBooking: json['dontWarrantyBooking'] as bool?,
      blockVehicleUntilStart: json['blockVehicleUntilStart'] as bool?,
      info: json['info'] == null
          ? null
          : ContractInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      search: json['search'] == null
          ? null
          : SearchModel.fromJson(json['search'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
      reglement: (json['reglement'] as List<dynamic>?)
          ?.map((e) => ReglementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sumReglement: json['sumReglement'] as String?,
      rate: json['rate'] == null
          ? null
          : RateModel.fromJson(json['rate'] as Map<String, dynamic>),
      historyReglement: (json['historyReglement'] as List<dynamic>?)
          ?.map(
              (e) => HistoryReglementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentaires: json['commentaires'] as List<dynamic>?,
      numberContrat: json['numberContrat'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] as String?,
      v: json['v'] as int?,
      signature: json['signature'] == null
          ? null
          : SignatureModel.fromJson(json['signature'] as Map<String, dynamic>),
      conditionAtStart: json['conditionAtStart'] == null
          ? null
          : json['conditionAtStart'] is String
              ? ConditionAtStartModel.fromJson({"id": json['conditionAtStart']})
              : ConditionAtStartModel.fromJson(
                  json['conditionAtStart'] as Map<String, dynamic>),
      conditionAtEnd: json['conditionAtEnd'] == null
          ? null
          : json['conditionAtEnd'] is String
              ? ConditionAtEndModel.fromJson({"id": json['conditionAtEnd']})
              : ConditionAtEndModel.fromJson(
                  json['conditionAtEnd'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContractModelToJson(ContractModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'comment': instance.comment,
      'deleted': instance.deleted,
      'status': instance.status,
      'isVehicleReturn': instance.isVehicleReturn,
      'isBooking': instance.isBooking,
      'blockTarif': instance.blockTarif,
      'dontWarrantyBooking': instance.dontWarrantyBooking,
      'blockVehicleUntilStart': instance.blockVehicleUntilStart,
      'info': instance.info?.toJson(),
      'customer': instance.customer?.toJson(),
      'search': instance.search?.toJson(),
      'vehicle': instance.vehicle?.toJson(),
      'driver': instance.driver?.toJson(),
      'reglement': instance.reglement?.map((e) => e.toJson()).toList(),
      'sumReglement': instance.sumReglement,
      'rate': instance.rate?.toJson(),
      'historyReglement':
          instance.historyReglement?.map((e) => e.toJson()).toList(),
      'commentaires': instance.commentaires,
      'numberContrat': instance.numberContrat,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'v': instance.v,
      'signature': instance.signature?.toJson(),
      'conditionAtStart': instance.conditionAtStart?.toJson(),
      'conditionAtEnd': instance.conditionAtEnd?.toJson(),
    };
