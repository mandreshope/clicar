// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reglement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReglementModel _$ReglementModelFromJson(Map<String, dynamic> json) =>
    ReglementModel(
      isNotCashed: json['isNotCashed'] as bool?,
      isValidate: json['isValidate'] as bool?,
      returnedCheque: json['returnedCheque'] as bool?,
      id_: json['_id'] as String?,
      id: json['id'] as int?,
      echeanceDate: json['echeanceDate'] as String?,
      periode: json['periode'] as String?,
      amountToPay: json['amountToPay'] as String?,
      type: json['type'] as String?,
      amount: json['amount'] as String?,
      avoirs: json['avoirs'] as String?,
      payementType: json['payementType'] as String?,
      payementMode: json['payementMode'] as String?,
      payementDate: json['payementDate'] as String?,
      agent: json['agent'] as String?,
      chequeNumber: json['chequeNumber'] as String?,
      customer: json['customer'] as String?,
      isFactured: json['isFactured'] as String?,
      payementArray: json['payementArray'] as List<dynamic>?,
    );

Map<String, dynamic> _$ReglementModelToJson(ReglementModel instance) =>
    <String, dynamic>{
      'isNotCashed': instance.isNotCashed,
      'isValidate': instance.isValidate,
      'returnedCheque': instance.returnedCheque,
      '_id': instance.id_,
      'id': instance.id,
      'echeanceDate': instance.echeanceDate,
      'periode': instance.periode,
      'amountToPay': instance.amountToPay,
      'type': instance.type,
      'amount': instance.amount,
      'avoirs': instance.avoirs,
      'payementType': instance.payementType,
      'payementMode': instance.payementMode,
      'payementDate': instance.payementDate,
      'agent': instance.agent,
      'chequeNumber': instance.chequeNumber,
      'customer': instance.customer,
      'isFactured': instance.isFactured,
      'payementArray': instance.payementArray,
    };
