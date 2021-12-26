import 'package:equatable/equatable.dart';

class Rent extends Equatable {
  final bool? isInsurance;
  final String? id_;
  final String? amount;
  final int? id;
  final String? unitPrice;
  final String? commercial;
  final String? locationType;
  final String? payementType;
  final String? duration;
  final String? echeanceBegin;
  final String? echeanceEnd;
  final String? echeanceDay;
  final String? payementMode;
  final String? kmInclus;

  const Rent({
    this.isInsurance,
    this.id_,
    this.amount,
    this.id,
    this.unitPrice,
    this.commercial,
    this.locationType,
    this.payementType,
    this.duration,
    this.echeanceBegin,
    this.echeanceEnd,
    this.echeanceDay,
    this.payementMode,
    this.kmInclus,
  });

  @override
  List<Object?> get props => [
        isInsurance,
        id_,
        amount,
        id,
        unitPrice,
        commercial,
        locationType,
        payementType,
        duration,
        echeanceBegin,
        echeanceEnd,
        echeanceDay,
        payementMode,
        kmInclus,
      ];
}
