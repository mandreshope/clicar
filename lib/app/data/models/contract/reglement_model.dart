import 'package:json_annotation/json_annotation.dart';
part 'reglement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReglementModel {
  bool? isNotCashed;
  bool? isValidate;
  bool? returnedCheque;
  @JsonKey(name: "_id")
  String? id_;
  int? id;
  String? echeanceDate;
  String? periode;
  String? amountToPay;
  String? type;
  String? amount;
  String? avoirs;
  String? payementType;
  String? payementMode;
  String? payementDate;
  String? agent;
  String? chequeNumber;
  String? customer;
  String? isFactured;
  List<dynamic>? payementArray;

  ReglementModel({
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

  factory ReglementModel.fromJson(Map<String, dynamic> json) =>
      _$ReglementModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReglementModelToJson(this);
}
