import 'package:clicar/app/domain/entities/contract/warranty.dart';
import 'package:json_annotation/json_annotation.dart';
part 'warranty_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WarrantyModel extends Warranty {
  @JsonKey(name: "_id")
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

  const WarrantyModel({
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
  }) : super(
          id_: id_,
          amount: amount,
          id: id,
          payementType: payementType,
          commercial: commercial,
          payementMode: payementMode,
          payementModality: payementModality,
          echeanceBegin: echeanceBegin,
          echeanceEnd: echeanceEnd,
          echeanceDay: echeanceDay,
        );

  factory WarrantyModel.fromJson(Map<String, dynamic> json) =>
      _$WarrantyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarrantyModelToJson(this);
}
