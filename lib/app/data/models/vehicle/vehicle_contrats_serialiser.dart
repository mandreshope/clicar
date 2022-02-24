import 'package:clicar/app/data/models/contract/contract_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:json_annotation/json_annotation.dart';

class VehicleContratsSerialiser
    implements JsonConverter<List<ContractModel?>?, List<dynamic>?> {
  const VehicleContratsSerialiser();

  @override
  List<ContractModel?>? fromJson(List? json) {
    return json
        ?.map((e) => e == null
            ? null
            : e is String
                ? ContractModel.fromJson({})
                : ContractModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  List? toJson(List<ContractModel?>? object) {
    return object?.map((e) => e?.toJson()).toList();
  }
}
