// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractInfoModel _$ContractInfoModelFromJson(Map<String, dynamic> json) =>
    ContractInfoModel(
      isReservation: json['isReservation'] as bool?,
      isAnticipe: json['isAnticipe'] as bool?,
      id: json['id'] as String?,
      departureDate: json['departureDate'] as String?,
      departureAgency: json['departureAgency'] as String?,
      returnDate: json['returnDate'] as String?,
      returnAgency: json['returnAgency'] as String?,
      anticipeReturnDate: json['anticipeReturnDate'],
      aniticipeReturnMotif: json['aniticipeReturnMotif'] as String?,
      depositAmount: json['depositAmount'] as String?,
      option: json['option'] as String?,
      payementModality: json['payementModality'] as String?,
      basePrice: json['basePrice'] as String?,
      kmReturn: json['kmReturn'] as String?,
      paymentFees: json['paymentFees'] as String?,
      commercial: json['commercial'] as String?,
      fuelReturn: json['fuelReturn'] as String?,
      kmInclus: json['kmInclus'] as String?,
      remise: json['remise'] as String?,
    );

Map<String, dynamic> _$ContractInfoModelToJson(ContractInfoModel instance) =>
    <String, dynamic>{
      'isReservation': instance.isReservation,
      'isAnticipe': instance.isAnticipe,
      'id': instance.id,
      'departureDate': instance.departureDate,
      'departureAgency': instance.departureAgency,
      'returnDate': instance.returnDate,
      'returnAgency': instance.returnAgency,
      'anticipeReturnDate': instance.anticipeReturnDate,
      'aniticipeReturnMotif': instance.aniticipeReturnMotif,
      'depositAmount': instance.depositAmount,
      'option': instance.option,
      'payementModality': instance.payementModality,
      'basePrice': instance.basePrice,
      'kmReturn': instance.kmReturn,
      'paymentFees': instance.paymentFees,
      'commercial': instance.commercial,
      'fuelReturn': instance.fuelReturn,
      'kmInclus': instance.kmInclus,
      'remise': instance.remise,
    };
