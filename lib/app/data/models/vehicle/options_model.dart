import 'package:clicar/app/domain/entities/vehicle/options.dart';
import 'package:json_annotation/json_annotation.dart';
part 'options_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionsModel extends Options {
  final String? gearBox;
  final String? color;
  final dynamic options;
  final List<dynamic>? equipments;
  final String? category;
  final int? motor;
  final double? additionalKmUnitPrice;

  const OptionsModel({
    this.gearBox,
    this.color,
    this.options,
    this.equipments,
    this.category,
    this.motor,
    this.additionalKmUnitPrice,
  }) : super(
          gearBox: gearBox,
          color: color,
          options: options,
          equipments: equipments,
          category: category,
          motor: motor,
          additionalKmUnitPrice: additionalKmUnitPrice,
        );

  factory OptionsModel.fromJson(Map<String, dynamic> json) =>
      _$OptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsModelToJson(this);
}
