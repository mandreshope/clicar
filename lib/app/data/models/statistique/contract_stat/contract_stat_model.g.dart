// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractStatModel _$ContractStatModelFromJson(Map<String, dynamic> json) =>
    ContractStatModel(
      nbContracts: json['nbContracts'] as int?,
      nbNewContrat: json['nbNewContrat'] as int?,
      nbCommands: json['nbCommands'] as int?,
      nbClassics: json['nbClassics'] as String?,
      nbNoRestitution: json['nbNoRestitution'] as String?,
      nbDepartureAndReturnCommands:
          json['nbDepartureAndReturnCommands'] as int?,
      nbDepartureAndReturnContracts:
          json['nbDepartureAndReturnContracts'] as int?,
      currentAmount: json['currentAmount'] as int?,
      closedAmount: json['closedAmount'] as int?,
      totalAmount: json['totalAmount'] as int?,
      newtotalAmount: json['newtotalAmount'] as int?,
      currentComparedToLastYear: json['currentComparedToLastYear'],
      closedComparedToLastYear: json['closedComparedToLastYear'],
      newContratComparedLastYear: json['newContratComparedLastYear'],
      totalComparedToLastYear: json['totalComparedToLastYear'],
      newContratTotalComparedToLastYearl:
          json['newContratTotalComparedToLastYearl'],
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserFactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      usersFact: (json['usersFact'] as List<dynamic>?)
          ?.map((e) => UserFactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContractStatModelToJson(ContractStatModel instance) =>
    <String, dynamic>{
      'nbContracts': instance.nbContracts,
      'nbNewContrat': instance.nbNewContrat,
      'nbCommands': instance.nbCommands,
      'nbClassics': instance.nbClassics,
      'nbNoRestitution': instance.nbNoRestitution,
      'nbDepartureAndReturnCommands': instance.nbDepartureAndReturnCommands,
      'nbDepartureAndReturnContracts': instance.nbDepartureAndReturnContracts,
      'currentAmount': instance.currentAmount,
      'closedAmount': instance.closedAmount,
      'totalAmount': instance.totalAmount,
      'newtotalAmount': instance.newtotalAmount,
      'currentComparedToLastYear': instance.currentComparedToLastYear,
      'closedComparedToLastYear': instance.closedComparedToLastYear,
      'newContratComparedLastYear': instance.newContratComparedLastYear,
      'totalComparedToLastYear': instance.totalComparedToLastYear,
      'newContratTotalComparedToLastYearl':
          instance.newContratTotalComparedToLastYearl,
      'users': instance.users,
      'usersFact': instance.usersFact,
    };
