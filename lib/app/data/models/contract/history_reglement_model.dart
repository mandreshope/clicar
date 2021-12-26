import 'package:json_annotation/json_annotation.dart';

part 'history_reglement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HistoryReglementModel {
  String? text;
  String? date;

  HistoryReglementModel({
    this.text,
    this.date,
  });

  factory HistoryReglementModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryReglementModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryReglementModelToJson(this);
}
