import 'package:json_annotation/json_annotation.dart';
part 'options_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionsModel {
  String? gearBox;
  String? color;
  List<dynamic>? options;
  List<dynamic>? equipments;
  String? category;
  int? motor;

  OptionsModel({
    this.gearBox,
    this.color,
    this.options,
    this.equipments,
    this.category,
    this.motor,
  });

  factory OptionsModel.fromJson(Map<String, dynamic> json) =>
      _$OptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsModelToJson(this);
}
