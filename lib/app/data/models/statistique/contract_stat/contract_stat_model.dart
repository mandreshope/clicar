import 'package:clicar/app/data/models/statistique/sale_turnover/user_fact_model.dart';
import 'package:clicar/app/domain/entities/statistique/contract_stat/contract_stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contract_stat_model.g.dart';

@JsonSerializable()
class ContractStatModel extends ContractStat {
  final int? nbContracts;
  final int? nbNewContrat;
  final int? nbCommands;
  final String? nbClassics;
  final String? nbNoRestitution;
  final int? nbDepartureAndReturnCommands;
  final int? nbDepartureAndReturnContracts;
  //
  final int? currentAmount;
  final int? closedAmount;
  final int? totalAmount;
  final int? newtotalAmount;
  final dynamic currentComparedToLastYear;
  final dynamic closedComparedToLastYear;
  final dynamic newContratComparedLastYear;
  final dynamic totalComparedToLastYear;
  final dynamic newContratTotalComparedToLastYearl;
  final List<UserFactModel>? users;
  final List<UserFactModel>? usersFact;
  const ContractStatModel({
    this.nbContracts,
    this.nbNewContrat,
    this.nbCommands,
    this.nbClassics,
    this.nbNoRestitution,
    this.nbDepartureAndReturnCommands,
    this.nbDepartureAndReturnContracts,
    this.currentAmount,
    this.closedAmount,
    this.totalAmount,
    this.newtotalAmount,
    this.currentComparedToLastYear,
    this.closedComparedToLastYear,
    this.newContratComparedLastYear,
    this.totalComparedToLastYear,
    this.newContratTotalComparedToLastYearl,
    this.users,
    this.usersFact,
  }) : super(
          nbContracts: nbContracts,
          nbNewContrat: nbNewContrat,
          nbCommands: nbCommands,
          nbClassics: nbClassics,
          nbNoRestitution: nbNoRestitution,
          nbDepartureAndReturnCommands: nbDepartureAndReturnCommands,
          nbDepartureAndReturnContracts: nbDepartureAndReturnContracts,
          currentAmount: currentAmount,
          closedAmount: closedAmount,
          totalAmount: totalAmount,
          newtotalAmount: newtotalAmount,
          currentComparedToLastYear: currentComparedToLastYear,
          closedComparedToLastYear: closedComparedToLastYear,
          newContratComparedLastYear: newContratComparedLastYear,
          totalComparedToLastYear: totalComparedToLastYear,
          newContratTotalComparedToLastYearl:
              newContratTotalComparedToLastYearl,
          users: users,
          usersFact: usersFact,
        );

  factory ContractStatModel.fromJson(Map<String, dynamic> json) =>
      _$ContractStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractStatModelToJson(this);
}
