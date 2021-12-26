import 'package:clicar/app/domain/entities/vehicle/sale.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sale_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SaleModel extends Sale {
  final String? saleLabel;

  const SaleModel({
    this.saleLabel,
  }) : super(saleLabel: saleLabel);

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaleModelToJson(this);
}
