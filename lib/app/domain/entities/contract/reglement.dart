import 'package:equatable/equatable.dart';

class Reglement extends Equatable {
  final bool? isNotCashed;
  final bool? isValidate;
  final bool? returnedCheque;
  final String? id_;
  final int? id;
  final String? echeanceDate;
  final String? periode;
  final String? amountToPay;
  final String? type;
  final String? amount;
  final String? avoirs;
  final String? payementType;
  final String? payementMode;
  final String? payementDate;
  final String? agent;
  final String? chequeNumber;
  final String? customer;
  final String? isFactured;
  final List<dynamic>? payementArray;

  const Reglement({
    this.isNotCashed,
    this.isValidate,
    this.returnedCheque,
    this.id_,
    this.id,
    this.echeanceDate,
    this.periode,
    this.amountToPay,
    this.type,
    this.amount,
    this.avoirs,
    this.payementType,
    this.payementMode,
    this.payementDate,
    this.agent,
    this.chequeNumber,
    this.customer,
    this.isFactured,
    this.payementArray,
  });

  @override
  List<Object?> get props => [
        isNotCashed,
        isValidate,
        returnedCheque,
        id_,
        id,
        echeanceDate,
        periode,
        amountToPay,
        type,
        amount,
        avoirs,
        payementType,
        payementMode,
        payementDate,
        agent,
        chequeNumber,
        customer,
        isFactured,
        payementArray,
      ];
}
