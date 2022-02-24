import 'package:clicar/app/domain/entities/contract/info_diver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_diver_model.g.dart';

@JsonSerializable()
class InfoDiverModel extends InfoDiver {
  final String? locationType;
  final String? contractTypeDetails;
  final String? aValider;
  final String? contratInfo;
  final dynamic contrat;

  const InfoDiverModel({
    this.locationType,
    this.contractTypeDetails,
    this.aValider,
    this.contratInfo,
    this.contrat,
  }) : super(
          locationType: locationType,
          contractTypeDetails: contractTypeDetails,
          aValider: aValider,
          contratInfo: contratInfo,
          contrat: contrat,
        );

  factory InfoDiverModel.fromJson(Map<String, dynamic> json) =>
      _$InfoDiverModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoDiverModelToJson(this);
}
