import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ContractCreatedBySerialiser
    implements JsonConverter<UserModel?, dynamic> {
  const ContractCreatedBySerialiser();

  @override
  UserModel? fromJson(dynamic json) {
    return json == null
        ? null
        : json is String
            ? UserModel.fromJson({})
            : UserModel.fromJson(json as Map<String, dynamic>);
  }

  @override
  Map? toJson(UserModel? object) {
    return object?.toJson();
  }
}
