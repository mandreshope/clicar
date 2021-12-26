import 'package:clicar/app/domain/entities/contract/history_reglement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_reglement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HistoryReglementModel extends HistoryReglement {
  final String? text;
  final String? date;

  const HistoryReglementModel({
    this.text,
    this.date,
  }) : super(text: text, date: date);

  factory HistoryReglementModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryReglementModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryReglementModelToJson(this);
}
