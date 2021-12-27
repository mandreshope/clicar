import 'package:clicar/app/domain/entities/contract/signature.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signature_model.g.dart';

@JsonSerializable()
class SignatureModel extends Signature {
  final String? id;
  final String? signature;
  final bool? isAccepted;

  const SignatureModel({
    this.id,
    this.signature,
    this.isAccepted,
  }) : super(
          id: id,
          signature: signature,
          isAccepted: isAccepted,
        );

  factory SignatureModel.fromJson(Map<String, dynamic> json) =>
      _$SignatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignatureModelToJson(this);
}
