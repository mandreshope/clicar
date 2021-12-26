import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String? id;
  final dynamic dateUpdate;
  final dynamic dateDelete;
  final dynamic deleteby;
  final int? deleted;
  final String? typeCustomer;
  final String? civility;
  final String? knowSociety;
  final String? other;
  final String? adresse1;
  final String? adresse2;
  final String? codePostal;
  final String? country;
  final String? city;
  final String? complement;
  final String? firstName;
  final String? lastName;
  final String? dateofBirth;
  final String? placeOfBirth;
  final String? numberPhonePro;
  final String? numberPhone;
  final String? mail;
  final List<dynamic>? documents;
  final String? createBy;
  final String? numberCustomer;
  final String? dateCreated;
  final int? v;
  final String? customerFirstName;
  final String? customerLastName;
  final dynamic updatedBy;

  const Customer({
    this.id,
    this.dateUpdate,
    this.dateDelete,
    this.deleteby,
    this.deleted,
    this.typeCustomer,
    this.civility,
    this.knowSociety,
    this.other,
    this.adresse1,
    this.adresse2,
    this.codePostal,
    this.country,
    this.city,
    this.complement,
    this.firstName,
    this.lastName,
    this.dateofBirth,
    this.placeOfBirth,
    this.numberPhonePro,
    this.numberPhone,
    this.mail,
    this.documents,
    this.createBy,
    this.numberCustomer,
    this.dateCreated,
    this.v,
    this.customerFirstName,
    this.customerLastName,
    this.updatedBy,
  });

  @override
  List<Object?> get props => [
        id,
        dateUpdate,
        dateDelete,
        deleteby,
        deleted,
        typeCustomer,
        civility,
        knowSociety,
        other,
        adresse1,
        adresse2,
        codePostal,
        country,
        city,
        complement,
        firstName,
        lastName,
        dateofBirth,
        placeOfBirth,
        numberPhonePro,
        numberPhone,
        mail,
        documents,
        createBy,
        numberCustomer,
        dateCreated,
        v,
        customerFirstName,
        customerLastName,
        updatedBy,
      ];
}
