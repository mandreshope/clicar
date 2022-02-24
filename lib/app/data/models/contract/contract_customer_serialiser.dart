import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ContractCustomerSerialiser
    implements JsonConverter<CustomerModel?, Map?> {
  const ContractCustomerSerialiser();

  @override
  CustomerModel? fromJson(Map? json) {
    return json == null
        ? null
        : json is String
            ? CustomerModel.fromJson({})
            : CustomerModel.fromJson(json as Map<String, dynamic>);
  }

  @override
  Map? toJson(CustomerModel? object) {
    return object?.toJson();
  }
}
