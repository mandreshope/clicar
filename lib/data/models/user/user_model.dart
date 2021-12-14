import 'package:clicar/domain/entities/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends User {
  @JsonKey(name: "_id")
  final String? id;
  final String? role;
  final bool? deleted;
  final String? lastName;
  final String? firstName;
  final String? username;
  final String? email;
  final String? password;
  final String? createdBy;
  final String? createdAt;

  const UserModel({
    this.role,
    this.deleted,
    this.id,
    this.lastName,
    this.firstName,
    this.username,
    this.email,
    this.password,
    this.createdBy,
    this.createdAt,
  }) : super(
          role: role,
          deleted: deleted,
          id: id,
          lastName: lastName,
          firstName: firstName,
          username: username,
          email: email,
          password: password,
          createdBy: createdBy,
          createdAt: createdAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
