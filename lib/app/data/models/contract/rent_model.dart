import 'package:clicar/app/domain/entities/contract/rent.dart';
import 'package:json_annotation/json_annotation.dart';
part 'rent_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RentModel extends Rent {
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

  const RentModel({
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
  }) : super(
          isInsurance: isInsurance,
          id_: id_,
          amount: amount,
          id: id,
          unitPrice: unitPrice,
          commercial: commercial,
          locationType: locationType,
          payementType: payementType,
          duration: duration,
          echeanceBegin: echeanceBegin,
          echeanceEnd: echeanceEnd,
          echeanceDay: echeanceDay,
          payementMode: payementMode,
          kmInclus: kmInclus,
        );

  factory RentModel.fromJson(Map<String, dynamic> json) =>
      _$RentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentModelToJson(this);
}
