import 'package:equatable/equatable.dart';

class Warranty extends Equatable {
  final String? id_;
  final String? amount;
  final int? id;
  final String? payementType;
  final String? commercial;
  final String? payementMode;
  final String? payementModality;
  final String? echeanceBegin;
  final String? echeanceEnd;
  final String? echeanceDay;

  const Warranty({
    this.id_,
    this.amount,
    this.id,
    this.payementType,
    this.commercial,
    this.payementMode,
    this.payementModality,
    this.echeanceBegin,
    this.echeanceEnd,
    this.echeanceDay,
  });

  @override
  List<Object?> get props => [
        id_,
        amount,
        id,
        payementType,
        commercial,
        payementMode,
        payementModality,
        echeanceBegin,
        echeanceEnd,
        echeanceDay,
      ];
}
