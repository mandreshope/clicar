// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: json['id'] as String?,
      note: json['note'] as String?,
      comment: json['comment'] as String?,
      deleted: json['deleted'] as bool?,
      status: json['status'] as int?,
      commentaires: json['commentaires'] as List<dynamic>?,
      customer: const ContractCustomerSerialiser().fromJson(json['customer']),
      description: json['description'] as String?,
      driver: json['driver'] == null
          ? null
          : DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      info: json['info'] == null
          ? null
          : ContractInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      infoDivers: json['infoDivers'] == null
          ? null
          : InfoDiverModel.fromJson(json['infoDivers'] as Map<String, dynamic>),
      numberReservation: json['numberReservation'] as String?,
      typeReservation: json['typeReservation'] as String?,
      rate: json['rate'] == null
          ? null
          : RateModel.fromJson(json['rate'] as Map<String, dynamic>),
      reglementList: (json['reglementList'] as List<dynamic>?)
          ?.map((e) => ReglementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      historyReglement: (json['historyReglement'] as List<dynamic>?)
          ?.map(
              (e) => HistoryReglementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy:
          const ContractCreatedBySerialiser().fromJson(json['createdBy']),
      createdAt: json['createdAt'] as String?,
      v: json['v'] as int?,
      updateBy: json['updateBy'] == null
          ? null
          : UserModel.fromJson(json['updateBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'comment': instance.comment,
      'deleted': instance.deleted,
      'status': instance.status,
      'commentaires': instance.commentaires,
      'customer': const ContractCustomerSerialiser().toJson(instance.customer),
      'description': instance.description,
      'driver': instance.driver?.toJson(),
      'vehicle': instance.vehicle?.toJson(),
      'info': instance.info?.toJson(),
      'infoDivers': instance.infoDivers?.toJson(),
      'numberReservation': instance.numberReservation,
      'typeReservation': instance.typeReservation,
      'rate': instance.rate?.toJson(),
      'reglementList': instance.reglementList?.map((e) => e.toJson()).toList(),
      'historyReglement':
          instance.historyReglement?.map((e) => e.toJson()).toList(),
      'createdBy':
          const ContractCreatedBySerialiser().toJson(instance.createdBy),
      'createdAt': instance.createdAt,
      'v': instance.v,
      'updateBy': instance.updateBy?.toJson(),
    };
