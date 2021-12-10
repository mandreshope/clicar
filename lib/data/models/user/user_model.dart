import 'package:clicar/domain/entities/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    String? role,
    bool? deleted,
    String? id,
    String? lastName,
    String? firstName,
    String? username,
    String? email,
    String? password,
    String? createdBy,
    String? createdAt,
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
