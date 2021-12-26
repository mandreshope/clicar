import 'package:json_annotation/json_annotation.dart';
part 'driver_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DriverModel {
  String? id;
  bool? deleted;
  String? customer;
  String? firstName;
  String? lastName;
  String? youngName;
  String? dateOfBirth;
  String? placeOfBirth;
  String? phoneNumber;
  String? portable;
  String? email;
  String? address;
  String? postalCode;
  String? city;
  String? complement;
  String? country;
  String? permisNumber;
  String? permisDelivery;
  String? permisPrefecture;
  String? ciOrPassportNumber;
  String? ciOrPassportNumberDelivery;
  String? ciOrPassportNumberPrefecture;
  String? createdAt;
  String? createdBy;
  String? driverNumber;
  int? v;

  DriverModel({
    this.id,
    this.deleted,
    this.customer,
    this.firstName,
    this.lastName,
    this.youngName,
    this.dateOfBirth,
    this.placeOfBirth,
    this.phoneNumber,
    this.portable,
    this.email,
    this.address,
    this.postalCode,
    this.city,
    this.complement,
    this.country,
    this.permisNumber,
    this.permisDelivery,
    this.permisPrefecture,
    this.ciOrPassportNumber,
    this.ciOrPassportNumberDelivery,
    this.ciOrPassportNumberPrefecture,
    this.createdAt,
    this.createdBy,
    this.driverNumber,
    this.v,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);
}
