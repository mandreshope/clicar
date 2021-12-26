import 'package:clicar/app/domain/entities/vehicle/options.dart';
import 'package:json_annotation/json_annotation.dart';
part 'options_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionsModel extends Options {
  final String? gearBox;
  final String? color;
  final List<dynamic>? options;
  final List<dynamic>? equipments;
  final String? category;
  final int? motor;

  const OptionsModel({
    this.gearBox,
    this.color,
    this.options,
    this.equipments,
    this.category,
    this.motor,
  }) : super(
          gearBox: gearBox,
          color: color,
          options: options,
          equipments: equipments,
          category: category,
          motor: motor,
        );

  factory OptionsModel.fromJson(Map<String, dynamic> json) =>
      _$OptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsModelToJson(this);
}
