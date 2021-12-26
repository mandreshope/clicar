import 'package:json_annotation/json_annotation.dart';
part 'sale_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SaleModel {
  String? saleLabel;

  SaleModel({
    this.saleLabel,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaleModelToJson(this);
}
