import 'package:json_annotation/json_annotation.dart';
part 'registration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegistrationModel {
  String? immat1;
  String? serialNumber;
  String? placeNumber;
  String? doorNumber;
  int? certificatePrice;
  String? cvNumber;
  String? fuelType;
  String? vehicleKind;
  String? vehicleType;
  String? immat1Date;
  String? immatCertificateDate;

  RegistrationModel({
    this.immat1,
    this.serialNumber,
    this.placeNumber,
    this.doorNumber,
    this.certificatePrice,
    this.cvNumber,
    this.fuelType,
    this.vehicleKind,
    this.vehicleType,
    this.immat1Date,
    this.immatCertificateDate,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}
