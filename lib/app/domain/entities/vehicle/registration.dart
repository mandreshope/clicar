import 'package:equatable/equatable.dart';

class Registration extends Equatable {
  final String? immat1;
  final String? serialNumber;
  final String? placeNumber;
  final String? doorNumber;
  final dynamic certificatePrice;
  final dynamic cvNumber;
  final String? fuelType;
  final String? vehicleKind;
  final String? vehicleType;
  final String? immat1Date;
  final String? immatCertificateDate;

  const Registration({
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

  @override
  List<Object?> get props => [
        immat1,
        serialNumber,
        placeNumber,
        doorNumber,
        certificatePrice,
        cvNumber,
        fuelType,
        vehicleKind,
        vehicleType,
        immat1Date,
        immatCertificateDate,
      ];
}
