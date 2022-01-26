import 'package:clicar/app/data/models/contract/contract_model.dart';
import 'package:clicar/app/data/models/vehicle/general_model.dart';
import 'package:clicar/app/data/models/vehicle/insurance_model.dart';
import 'package:clicar/app/data/models/vehicle/options_model.dart';
import 'package:clicar/app/data/models/vehicle/purchase_model.dart';
import 'package:clicar/app/data/models/vehicle/registration_model.dart';
import 'package:clicar/app/data/models/vehicle/sale_model.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';

import 'package:json_annotation/json_annotation.dart';
part 'vehicle_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VehicleModel extends Vehicle {
  final String? id;
  final List<dynamic>? immos;
  final List<dynamic>? maintenances;
  final List<dynamic>? pvs;
  final bool? deleted;
  final List<ContractModel>? contrats;
  final List<dynamic>? locations;
  final String? number;
  final String? immat1;
  final String? immat2;
  final String? serialNumber;
  final String? mark;
  final String? modele;
  final String? state;
  final GeneralModel? general;
  final OptionsModel? options;
  final PurchaseModel? purchase;
  final RegistrationModel? registration;
  final SaleModel? sale;
  final InsuranceModel? insurance;
  final dynamic documents;
  final String? createdBy;
  final String? createdAt;
  final int? v;

  const VehicleModel({
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
  }) : super(
          id: id,
          immos: immos,
          maintenances: maintenances,
          pvs: pvs,
          deleted: deleted,
          contrats: contrats,
          locations: locations,
          number: number,
          immat1: immat1,
          immat2: immat2,
          serialNumber: serialNumber,
          mark: mark,
          modele: modele,
          state: state,
          general: general,
          options: options,
          purchase: purchase,
          registration: registration,
          sale: sale,
          insurance: insurance,
          documents: documents,
          createdBy: createdBy,
          createdAt: createdAt,
          v: v,
        );

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
