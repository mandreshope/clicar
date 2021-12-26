import 'package:json_annotation/json_annotation.dart';
part 'purchase_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PurchaseModel {
  String? financing;

  PurchaseModel({
    this.financing,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseModelToJson(this);
}
