import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:json_annotation/json_annotation.dart';
part 'driver_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DriverModel extends Driver {
  final String? id;
  final bool? deleted;
  final String? customer;
  final String? firstName;
  final String? lastName;
  final String? youngName;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? phoneNumber;
  final String? portable;
  final String? email;
  final String? address;
  final String? postalCode;
  final String? city;
  final String? complement;
  final String? country;
  final String? permisNumber;
  final String? permisDelivery;
  final String? permisPrefecture;
  final String? ciOrPassportNumber;
  final String? ciOrPassportNumberDelivery;
  final String? ciOrPassportNumberPrefecture;
  final String? createdAt;
  final String? createdBy;
  final String? driverNumber;
  final int? v;

  const DriverModel({
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
  }) : super(
          id: id,
          deleted: deleted,
          customer: customer,
          firstName: firstName,
          lastName: lastName,
          youngName: youngName,
          dateOfBirth: dateOfBirth,
          placeOfBirth: placeOfBirth,
          phoneNumber: phoneNumber,
          portable: portable,
          email: email,
          address: address,
          postalCode: postalCode,
          city: city,
          complement: complement,
          country: country,
          permisNumber: permisNumber,
          permisDelivery: permisDelivery,
          permisPrefecture: permisPrefecture,
          ciOrPassportNumber: ciOrPassportNumber,
          ciOrPassportNumberDelivery: ciOrPassportNumberDelivery,
          ciOrPassportNumberPrefecture: ciOrPassportNumberPrefecture,
          createdAt: createdAt,
          createdBy: createdBy,
          driverNumber: driverNumber,
          v: v,
        );

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);

  Map<String, dynamic> toJson() => _$DriverModelToJson(this);
}
