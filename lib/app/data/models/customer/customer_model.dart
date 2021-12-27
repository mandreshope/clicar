import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerModel extends Customer {
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
  final dynamic documents;
  final String? createBy;
  final String? numberCustomer;
  final String? dateCreated;
  final int? v;
  final String? customerFirstName;
  final String? customerLastName;
  final dynamic updatedBy;

  const CustomerModel({
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
  }) : super(
          id: id,
          dateUpdate: dateUpdate,
          dateDelete: dateDelete,
          deleteby: deleteby,
          deleted: deleted,
          typeCustomer: typeCustomer,
          civility: civility,
          knowSociety: knowSociety,
          other: other,
          adresse1: adresse1,
          adresse2: adresse2,
          codePostal: codePostal,
          country: country,
          city: city,
          complement: complement,
          firstName: firstName,
          lastName: lastName,
          dateofBirth: dateofBirth,
          placeOfBirth: placeOfBirth,
          numberPhonePro: numberPhonePro,
          numberPhone: numberPhone,
          mail: mail,
          documents: documents,
          createBy: createBy,
          numberCustomer: numberCustomer,
          dateCreated: dateCreated,
          v: v,
          customerFirstName: customerFirstName,
          customerLastName: customerLastName,
          updatedBy: updatedBy,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
