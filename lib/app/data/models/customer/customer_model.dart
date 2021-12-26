import 'package:json_annotation/json_annotation.dart';
part 'customer_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomerModel {
  String? id;
  dynamic dateUpdate;
  dynamic dateDelete;
  dynamic deleteby;
  int? deleted;
  String? typeCustomer;
  String? civility;
  String? knowSociety;
  String? other;
  String? adresse1;
  String? adresse2;
  String? codePostal;
  String? country;
  String? city;
  String? complement;
  String? firstName;
  String? lastName;
  String? dateofBirth;
  String? placeOfBirth;
  String? numberPhonePro;
  String? numberPhone;
  String? mail;
  List<dynamic>? documents;
  String? createBy;
  String? numberCustomer;
  String? dateCreated;
  int? v;
  String? customerFirstName;
  String? customerLastName;
  dynamic updatedBy;

  CustomerModel({
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

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
