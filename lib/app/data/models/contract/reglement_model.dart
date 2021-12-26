import 'package:clicar/app/domain/entities/contract/reglement.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reglement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReglementModel extends Reglement {
  final bool? isNotCashed;
  final bool? isValidate;
  final bool? returnedCheque;
  @JsonKey(name: "_id")
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

  const ReglementModel({
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
  }) : super(
          isNotCashed: isNotCashed,
          isValidate: isValidate,
          returnedCheque: returnedCheque,
          id_: id_,
          id: id,
          echeanceDate: echeanceDate,
          periode: periode,
          amountToPay: amountToPay,
          type: type,
          amount: amount,
          avoirs: avoirs,
          payementType: payementType,
          payementMode: payementMode,
          payementDate: payementDate,
          agent: agent,
          chequeNumber: chequeNumber,
          customer: customer,
          isFactured: isFactured,
          payementArray: payementArray,
        );

  factory ReglementModel.fromJson(Map<String, dynamic> json) =>
      _$ReglementModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReglementModelToJson(this);
}
