import 'package:json_annotation/json_annotation.dart';
part 'warranty_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WarrantyModel {
  @JsonKey(name: "_id")
  String? id_;
  String? amount;
  int? id;
  String? payementType;
  String? commercial;
  String? payementMode;
  String? payementModality;
  String? echeanceBegin;
  String? echeanceEnd;
  String? echeanceDay;

  WarrantyModel({
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

  factory WarrantyModel.fromJson(Map<String, dynamic> json) =>
      _$WarrantyModelFromJson(json);

  Map<String, dynamic> toJson() => _$WarrantyModelToJson(this);
}
