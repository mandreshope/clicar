import 'package:clicar/app/domain/entities/vehicle/purchase.dart';
import 'package:json_annotation/json_annotation.dart';
part 'purchase_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PurchaseModel extends Purchase {
  final String? financing;

  const PurchaseModel({
    this.financing,
  }) : super(financing: financing);

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseModelToJson(this);
}
