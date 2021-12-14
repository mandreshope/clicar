import 'package:clicar/domain/entities/auth/forgot_password.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_model.g.dart';

@JsonSerializable()
class ForgotPasswordModel extends ForgotPassword {
  const ForgotPasswordModel({String? message, String? status})
      : super(message: message, status: status);

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordModelToJson(this);
}
