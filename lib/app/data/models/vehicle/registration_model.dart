import 'package:clicar/app/domain/entities/vehicle/registration.dart';
import 'package:json_annotation/json_annotation.dart';
part 'registration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegistrationModel extends Registration {
  final String? immat1;
  final String? serialNumber;
  final String? placeNumber;
  final String? doorNumber;
  final int? certificatePrice;
  final String? cvNumber;
  final String? fuelType;
  final String? vehicleKind;
  final String? vehicleType;
  final String? immat1Date;
  final String? immatCertificateDate;

  const RegistrationModel({
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
  }) : super(
          immat1: immat1,
          serialNumber: serialNumber,
          placeNumber: placeNumber,
          doorNumber: doorNumber,
          certificatePrice: certificatePrice,
          cvNumber: cvNumber,
          fuelType: fuelType,
          vehicleKind: vehicleKind,
          vehicleType: vehicleType,
          immat1Date: immat1Date,
          immatCertificateDate: immatCertificateDate,
        );

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}
