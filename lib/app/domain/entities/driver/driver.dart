import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:equatable/equatable.dart';

class Driver extends Equatable {
  final String? id;
  final bool? deleted;
  final Customer? customer;
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

  const Driver({
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

  @override
  List<Object?> get props => [
        id,
        deleted,
        customer,
        firstName,
        lastName,
        youngName,
        dateOfBirth,
        placeOfBirth,
        phoneNumber,
        portable,
        email,
        address,
        postalCode,
        city,
        complement,
        country,
        permisNumber,
        permisDelivery,
        permisPrefecture,
        ciOrPassportNumber,
        ciOrPassportNumberDelivery,
        ciOrPassportNumberPrefecture,
        createdAt,
        createdBy,
        driverNumber,
        v,
      ];
}
