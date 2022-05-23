import 'package:clicar/app/data/models/statistique/sale_turnover/user_fact_model.dart';
import 'package:clicar/app/domain/entities/statistique/sale_turnover/sale_turnover.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_turnover_model.g.dart';

@JsonSerializable()
class SaleTurnoverModel extends SaleTurnover {
  final int? amount;
  final int? retardPaying;
  final int? waranty;
  final int? amountToPay;
  final int? totalContravention;
  final int? objectif;
  @JsonKey(name: 'GrapAmountToPay')
  final List<int>? grapAmountToPay;
  @JsonKey(name: 'GrapAmount')
  final List<int>? grapAmount;
  @JsonKey(name: 'MothSelected')
  final List<String>? mothSelected;
  final String? calculPourentageAmountToPay;
  final String? calculPourentageAmount;
  final String? retardEncaissement;
  final String? pourcentageRetardEncaissement;
  final List<UserFactModel>? usersFact;
  const SaleTurnoverModel({
    this.amount,
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
    this.usersFact,
  }) : super(
          amount: amount,
          retardPaying: retardPaying,
          waranty: waranty,
          amountToPay: amountToPay,
          totalContravention: totalContravention,
          objectif: objectif,
          grapAmountToPay: grapAmountToPay,
          grapAmount: grapAmount,
          mothSelected: mothSelected,
          calculPourentageAmountToPay: calculPourentageAmountToPay,
          calculPourentageAmount: calculPourentageAmount,
          retardEncaissement: retardEncaissement,
          pourcentageRetardEncaissement: pourcentageRetardEncaissement,
          usersFact: usersFact,
        );

  factory SaleTurnoverModel.fromJson(Map<String, dynamic> json) =>
      _$SaleTurnoverModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaleTurnoverModelToJson(this);
}
