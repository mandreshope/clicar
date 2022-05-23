import 'package:equatable/equatable.dart';

class EncaissementStat extends Equatable {
  final int? retardPayingInClosedAmount;
  final int? montantTotalClosed;
  final String? calculPoucentageretardPayingInClosedAmount;
  final List<String>? mothSelected;

  const EncaissementStat({
    this.retardPayingInClosedAmount,
    this.montantTotalClosed,
    this.calculPoucentageretardPayingInClosedAmount,
    this.mothSelected,
  });

  @override
  List<Object?> get props => [
        retardPayingInClosedAmount,
        montantTotalClosed,
        calculPoucentageretardPayingInClosedAmount,
        mothSelected,
      ];
}
