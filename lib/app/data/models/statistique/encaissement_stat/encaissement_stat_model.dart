import 'package:clicar/app/domain/entities/statistique/encaissement_stat/encaissement_stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'encaissement_stat_model.g.dart';

@JsonSerializable()
class EncaissementStatModel extends EncaissementStat {
  final int? retardPayingInClosedAmount;
  final int? montantTotalClosed;
  final String? calculPoucentageretardPayingInClosedAmount;
  final List<String>? mothSelected;

  const EncaissementStatModel({
    this.retardPayingInClosedAmount,
    this.montantTotalClosed,
    this.calculPoucentageretardPayingInClosedAmount,
    this.mothSelected,
  }) : super(
          retardPayingInClosedAmount: retardPayingInClosedAmount,
          montantTotalClosed: montantTotalClosed,
          calculPoucentageretardPayingInClosedAmount:
              calculPoucentageretardPayingInClosedAmount,
          mothSelected: mothSelected,
        );

  factory EncaissementStatModel.fromJson(Map<String, dynamic> json) =>
      _$EncaissementStatModelFromJson(json);

  Map<String, dynamic> toJson() => _$EncaissementStatModelToJson(this);
}
