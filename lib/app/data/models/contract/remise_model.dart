import 'package:json_annotation/json_annotation.dart';
part 'remise_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemiseModel {
  List<String>? echeanceToApplicate;
  String? id_;
  int? id;
  String? commercial;
  String? motif;
  String? amount;
  String? remiseBegin;
  String? remiseEnd;
  String? aValider;

  RemiseModel({
    this.echeanceToApplicate,
    this.id_,
    this.id,
    this.commercial,
    this.motif,
    this.amount,
    this.remiseBegin,
    this.remiseEnd,
    this.aValider,
  });

  factory RemiseModel.fromJson(Map<String, dynamic> json) =>
      _$RemiseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemiseModelToJson(this);
}
