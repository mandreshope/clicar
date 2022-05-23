import 'package:clicar/app/domain/entities/statistique/sale_turnover/user_facts.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_fact_model.g.dart';

@JsonSerializable()
class UserFactModel extends UserFact {
  final String? id;
  final String? role;
  final bool? deleted;
  final String? lastName;
  final String? firstName;
  final String? username;
  final String? email;
  final String? password;
  final String? createdBy;
  final String? categorie;
  final String? createdAt;
  final int? v;
  final int? createdContracts;

  const UserFactModel({
    this.id,
    this.deleted,
    this.role,
    this.lastName,
    this.firstName,
    this.username,
    this.email,
    this.password,
    this.createdBy,
    this.categorie,
    this.createdAt,
    this.v,
    this.createdContracts,
  }) : super(
          id: id,
          deleted: deleted,
          role: role,
          lastName: lastName,
          firstName: firstName,
          username: username,
          email: email,
          password: password,
          createdBy: createdBy,
          categorie: categorie,
          createdAt: createdAt,
          v: v,
          createdContracts: createdContracts,
        );

  factory UserFactModel.fromJson(Map<String, dynamic> json) =>
      _$UserFactModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserFactModelToJson(this);
}
