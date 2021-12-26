import 'package:clicar/app/data/models/vehicle/general_model.dart';
import 'package:clicar/app/data/models/vehicle/insurance_model.dart';
import 'package:clicar/app/data/models/vehicle/options_model.dart';
import 'package:clicar/app/data/models/vehicle/purchase_model.dart';
import 'package:clicar/app/data/models/vehicle/registration_model.dart';
import 'package:clicar/app/data/models/vehicle/sale_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'vehicle_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VehicleModel {
  String? id;
  List<dynamic>? immos;
  List<dynamic>? maintenances;
  List<dynamic>? pvs;
  bool? deleted;
  List<String>? contrats;
  List<dynamic>? locations;
  String? number;
  String? immat1;
  String? immat2;
  String? serialNumber;
  String? mark;
  String? modele;
  String? state;
  GeneralModel? general;
  OptionsModel? options;
  PurchaseModel? purchase;
  RegistrationModel? registration;
  SaleModel? sale;
  InsuranceModel? insurance;
  List<dynamic>? documents;
  String? createdBy;
  String? createdAt;
  int? v;

  VehicleModel({
    this.id,
    this.immos,
    this.maintenances,
    this.pvs,
    this.deleted,
    this.contrats,
    this.locations,
    this.number,
    this.immat1,
    this.immat2,
    this.serialNumber,
    this.mark,
    this.modele,
    this.state,
    this.general,
    this.options,
    this.purchase,
    this.registration,
    this.sale,
    this.insurance,
    this.documents,
    this.createdBy,
    this.createdAt,
    this.v,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
