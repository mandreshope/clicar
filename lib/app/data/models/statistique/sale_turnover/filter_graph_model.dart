import 'package:clicar/app/domain/entities/statistique/sale_turnover/filter_graph.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_graph_model.g.dart';

@JsonSerializable()
class FilterGraphModel extends FilterGraph {
  @JsonKey(name: 'GrapAmountToPay')
  final List<int>? grapAmountToPay;
  @JsonKey(name: 'GrapAmount')
  final List<int>? grapAmount;
  @JsonKey(name: 'MothSelected')
  final List<String>? mothSelected;

  const FilterGraphModel({
    this.grapAmountToPay,
    this.grapAmount,
    this.mothSelected,
  }) : super(
          grapAmountToPay: grapAmountToPay,
          grapAmount: grapAmount,
          mothSelected: mothSelected,
        );

  factory FilterGraphModel.fromJson(Map<String, dynamic> json) =>
      _$FilterGraphModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterGraphModelToJson(this);
}
