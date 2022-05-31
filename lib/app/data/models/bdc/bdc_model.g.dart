// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bdc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BdcModel _$BdcModelFromJson(Map<String, dynamic> json) => BdcModel(
      id: json['id'] as String?,
      vehicleChecked: json['vehicleChecked'] as bool?,
      note: json['note'] as String?,
      comment: json['comment'] as String?,
      deleted: json['deleted'] as bool?,
      status: json['status'] as int?,
      isVehicleReturn: json['isVehicleReturn'] as bool?,
      isBooking: json['isBooking'] as bool?,
      blockTarif: json['blockTarif'] as bool?,
      dontWarrantyBooking: json['dontWarrantyBooking'] as bool?,
      blockVehicleUntilStart: json['blockVehicleUntilStart'] as bool?,
      cautionIsReturned: json['cautionIsReturned'] as bool?,
      hasBeenTransformed: json['hasBeenTransformed'] as bool?,
      creanceMRC: json['creanceMRC'] as bool?,
      info: json['info'] == null
          ? null
          : ContractInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      search: json['search'] == null
          ? null
          : SearchModel.fromJson(json['search'] as Map<String, dynamic>),
      vehicleBooking: json['vehicleBooking'] == null
          ? null
          : VehicleBookingModel.fromJson(
              json['vehicleBooking'] as Map<String, dynamic>),
      reglement: json['reglement'] as List<dynamic>?,
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
      createdBy: json['createdBy'] == null
          ? null
          : UserModel.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      otherHistory: json['otherHistory'] as List<dynamic>?,
      v: json['v'] as int?,
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BdcModelToJson(BdcModel instance) => <String, dynamic>{
      'id': instance.id,
      'vehicleChecked': instance.vehicleChecked,
      'note': instance.note,
      'comment': instance.comment,
      'deleted': instance.deleted,
      'status': instance.status,
      'isVehicleReturn': instance.isVehicleReturn,
      'isBooking': instance.isBooking,
      'blockTarif': instance.blockTarif,
      'dontWarrantyBooking': instance.dontWarrantyBooking,
      'blockVehicleUntilStart': instance.blockVehicleUntilStart,
      'cautionIsReturned': instance.cautionIsReturned,
      'hasBeenTransformed': instance.hasBeenTransformed,
      'creanceMRC': instance.creanceMRC,
      'info': instance.info?.toJson(),
      'customer': instance.customer?.toJson(),
      'search': instance.search?.toJson(),
      'vehicleBooking': instance.vehicleBooking?.toJson(),
      'reglement': instance.reglement,
      'sumReglement': instance.sumReglement,
      'rate': instance.rate?.toJson(),
      'historyReglement':
          instance.historyReglement?.map((e) => e.toJson()).toList(),
      'commentaires': instance.commentaires,
      'numberContrat': instance.numberContrat,
      'createdBy': instance.createdBy?.toJson(),
      'createdAt': instance.createdAt,
      'otherHistory': instance.otherHistory,
      'v': instance.v,
      'vehicle': instance.vehicle?.toJson(),
    };
