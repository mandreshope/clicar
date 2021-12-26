import 'package:json_annotation/json_annotation.dart';
part 'rent_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RentModel {
  bool? isInsurance;
  @JsonKey(name: "_id")
  String? id_;
  String? amount;
  int? id;
  String? unitPrice;
  String? commercial;
  String? locationType;
  String? payementType;
  String? duration;
  String? echeanceBegin;
  String? echeanceEnd;
  String? echeanceDay;
  String? payementMode;
  String? kmInclus;

  RentModel({
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

  factory RentModel.fromJson(Map<String, dynamic> json) =>
      _$RentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentModelToJson(this);
}
