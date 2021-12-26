import 'package:json_annotation/json_annotation.dart';
part 'insurance_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InsuranceModel {
  String? handledByClient;
  String? insurer;
  String? optionalInsurance;
  String? type;

  InsuranceModel({
    this.handledByClient,
    this.insurer,
    this.optionalInsurance,
    this.type,
  });

  factory InsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceModelToJson(this);
}
