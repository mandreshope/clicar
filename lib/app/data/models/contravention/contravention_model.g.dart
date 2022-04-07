// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contravention_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContraventionModel _$ContraventionModelFromJson(Map<String, dynamic> json) =>
    ContraventionModel(
      id: json['id'] as String?,
      state: json['state'] as String?,
      date: json['date'] as String?,
      path: json['path'] as String?,
      filename: json['filename'] as String?,
      immat: json['immat'] as String?,
      vehicle: json['vehicle'],
      infractionDate: json['infractionDate'] as String?,
      numberContract: json['numberContract'] as String?,
      client: json['client'],
      type: json['type'] as String?,
      noticeNumber: json['noticeNumber'] as String?,
      noticeDate: json['noticeDate'] as String?,
      vpPrice: json['vpPrice'] as String?,
      FDG: json['FDG'] as String?,
      total: json['total'] as String?,
      treatmentDate: json['treatmentDate'] as String?,
      agentPayement: json['agentPayement'] as String?,
      status: json['status'] as String?,
      limitDate: json['limitDate'] as String?,
      createdBy: json['createdBy'],
      createdAt: json['createdAt'] as String?,
      contrats: json['contrats'],
      transform: json['transform'],
      isMajore: json['isMajore'] as bool?,
      document: json['document'],
      dateDenoncer: json['dateDenoncer'] as String?,
      dateDenonciation: json['dateDenonciation'] as String?,
      numDenoncer: json['numDenoncer'] as String?,
      search: json['search'],
    );

Map<String, dynamic> _$ContraventionModelToJson(ContraventionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'date': instance.date,
      'path': instance.path,
      'filename': instance.filename,
      'immat': instance.immat,
      'vehicle': instance.vehicle,
      'infractionDate': instance.infractionDate,
      'numberContract': instance.numberContract,
      'client': instance.client,
      'type': instance.type,
      'noticeNumber': instance.noticeNumber,
      'noticeDate': instance.noticeDate,
      'vpPrice': instance.vpPrice,
      'FDG': instance.FDG,
      'total': instance.total,
      'treatmentDate': instance.treatmentDate,
      'agentPayement': instance.agentPayement,
      'status': instance.status,
      'limitDate': instance.limitDate,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'contrats': instance.contrats,
      'transform': instance.transform,
      'isMajore': instance.isMajore,
      'document': instance.document,
      'dateDenoncer': instance.dateDenoncer,
      'dateDenonciation': instance.dateDenonciation,
      'numDenoncer': instance.numDenoncer,
      'search': instance.search,
    };
