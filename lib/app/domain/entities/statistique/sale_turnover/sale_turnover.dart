import 'package:clicar/app/domain/entities/statistique/sale_turnover/user_facts.dart';
import 'package:equatable/equatable.dart';

class SaleTurnover extends Equatable {
  final int? amount;
  final int? retardPaying;
  final int? waranty;
  final int? amountToPay;
  final int? totalContravention;
  final int? objectif;
  final List<int>? grapAmountToPay;
  final List<int>? grapAmount;
  final List<String>? mothSelected;
  final String? calculPourentageAmountToPay;
  final String? calculPourentageAmount;
  final String? retardEncaissement;
  final String? pourcentageRetardEncaissement;
  final List<UserFact>? usersFact;
  const SaleTurnover(
      {this.amount,
      this.retardPaying,
      this.waranty,
      this.amountToPay,
      this.totalContravention,
      this.objectif,
      this.grapAmountToPay,
      this.grapAmount,
      this.mothSelected,
      this.calculPourentageAmountToPay,
      this.calculPourentageAmount,
      this.retardEncaissement,
      this.pourcentageRetardEncaissement,
      this.usersFact});

  @override
  List<Object?> get props => [
        amount,
        retardPaying,
        waranty,
        amountToPay,
        totalContravention,
        objectif,
        grapAmountToPay,
        grapAmount,
        mothSelected,
        calculPourentageAmountToPay,
        calculPourentageAmount,
        retardEncaissement,
        pourcentageRetardEncaissement,
        usersFact,
      ];
}
