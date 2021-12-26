import 'package:clicar/app/domain/entities/contract/search.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchModel extends Search {
  final String? id;
  final String? number;
  final String? name;
  final String? mail;
  final String? phone;

  const SearchModel({
    this.id,
    this.number,
    this.name,
    this.mail,
    this.phone,
  }) : super(
          id: id,
          number: number,
          name: name,
          mail: mail,
          phone: phone,
        );

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
