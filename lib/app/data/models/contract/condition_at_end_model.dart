import 'package:clicar/app/domain/entities/contract/condition_at_end.dart';
import 'package:json_annotation/json_annotation.dart';

part 'condition_at_end_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConditionAtEndModel extends ConditionAtEnd {
  final List<String>? conditions;
  final List<String>? faults;
  final String? id;
  final String? conditionDate;
  final String? comment;
  final int? km;
  final int? fuelQuantity;
  final String? signature;
  final String? signatureDate;

  const ConditionAtEndModel({
    this.conditions,
    this.faults,
    this.id,
    this.conditionDate,
    this.comment,
    this.km,
    this.fuelQuantity,
    this.signature,
    this.signatureDate,
  }) : super(
          conditions: conditions,
          faults: faults,
          id: id,
          conditionDate: conditionDate,
          comment: comment,
          km: km,
          fuelQuantity: fuelQuantity,
          signatureDate: signatureDate,
          signature: signature,
        );

  factory ConditionAtEndModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionAtEndModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionAtEndModelToJson(this);
}
