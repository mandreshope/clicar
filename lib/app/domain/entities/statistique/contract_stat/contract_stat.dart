import 'package:clicar/app/domain/entities/statistique/sale_turnover/user_facts.dart';
import 'package:equatable/equatable.dart';

class ContractStat extends Equatable {
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
  final List<UserFact>? users;
  final List<UserFact>? usersFact;
  const ContractStat({
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
  });

  @override
  List<Object?> get props => [
        nbContracts,
        nbNewContrat,
        nbCommands,
        nbClassics,
        nbNoRestitution,
        nbDepartureAndReturnCommands,
        nbDepartureAndReturnContracts,
        currentAmount,
        closedAmount,
        totalAmount,
        newtotalAmount,
        currentComparedToLastYear,
        closedComparedToLastYear,
        newContratComparedLastYear,
        totalComparedToLastYear,
        newContratTotalComparedToLastYearl,
        users,
        usersFact,
      ];
}
