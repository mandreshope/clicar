import 'package:clicar/app/domain/entities/vehicle/insurance.dart';
import 'package:json_annotation/json_annotation.dart';
part 'insurance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InsuranceModel extends Insurance {
  final String? handledByClient;
  final dynamic insurer;
  final dynamic optionalInsurance;
  final String? type;

  const InsuranceModel({
    this.handledByClient,
    this.insurer,
    this.optionalInsurance,
    this.type,
  }) : super(
          handledByClient: handledByClient,
          insurer: insurer,
          optionalInsurance: optionalInsurance,
          type: type,
        );

  factory InsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceModelToJson(this);
}
