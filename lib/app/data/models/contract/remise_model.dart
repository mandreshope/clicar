import 'package:clicar/app/domain/entities/contract/remise.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remise_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemiseModel extends Remise {
  final List<String>? echeanceToApplicate;
  final String? id_;
  final int? id;
  final String? commercial;
  final String? motif;
  final String? amount;
  final String? remiseBegin;
  final String? remiseEnd;
  final String? aValider;

  const RemiseModel({
    this.echeanceToApplicate,
    this.id_,
    this.id,
    this.commercial,
    this.motif,
    this.amount,
    this.remiseBegin,
    this.remiseEnd,
    this.aValider,
  }) : super(
          echeanceToApplicate: echeanceToApplicate,
          id_: id_,
          id: id,
          commercial: commercial,
          motif: motif,
          amount: amount,
          remiseBegin: remiseBegin,
          remiseEnd: remiseEnd,
          aValider: aValider,
        );

  factory RemiseModel.fromJson(Map<String, dynamic> json) =>
      _$RemiseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemiseModelToJson(this);
}
