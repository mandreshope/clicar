import 'package:clicar/data/models/user/user_model.dart';
import 'package:clicar/domain/entities/auth/register.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterModel extends Register {
  @JsonKey(name: "user")
  final UserModel userModel;
  const RegisterModel({required String token, required this.userModel})
      : super(token: token, user: userModel);

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
