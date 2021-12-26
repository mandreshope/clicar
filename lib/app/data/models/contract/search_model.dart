import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchModel {
  String? id;
  String? number;
  String? name;
  String? mail;
  String? phone;

  SearchModel({
    this.id,
    this.number,
    this.name,
    this.mail,
    this.phone,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
