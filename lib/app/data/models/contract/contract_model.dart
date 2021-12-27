import 'package:clicar/app/data/models/contract/info_model.dart';
import 'package:clicar/app/data/models/contract/rate_model.dart';
import 'package:clicar/app/data/models/contract/reglement_model.dart';
import 'package:clicar/app/data/models/contract/search_model.dart';
import 'package:clicar/app/data/models/contract/signature_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/driver/driver_model.dart';
import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:json_annotation/json_annotation.dart';

import 'history_reglement_model.dart';

part 'contract_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractModel extends Contract {
  final String? id;
  final String? note;
  final String? comment;
  final bool? deleted;
  final int? status;
  final bool? isVehicleReturn;
  final bool? isBooking;
  final bool? blockTarif;
  final bool? dontWarrantyBooking;
  final bool? blockVehicleUntilStart;
  final ContractInfoModel? info;
  final CustomerModel? customer;
  final SearchModel? search;
  final VehicleModel? vehicle;
  final DriverModel? driver;
  final List<ReglementModel>? reglement;
  final String? sumReglement;
  final RateModel? rate;
  final List<HistoryReglementModel>? historyReglement;
  final List<dynamic>? commentaires;
  final String? numberContrat;
  final String? createdBy;
  final String? createdAt;
  final int? v;
  final SignatureModel? signature;

  const ContractModel({
    this.id,
    this.note,
    this.comment,
    this.deleted,
    this.status,
    this.isVehicleReturn,
    this.isBooking,
    this.blockTarif,
    this.dontWarrantyBooking,
    this.blockVehicleUntilStart,
    this.info,
    this.customer,
    this.search,
    this.vehicle,
    this.driver,
    this.reglement,
    this.sumReglement,
    this.rate,
    this.historyReglement,
    this.commentaires,
    this.numberContrat,
    this.createdBy,
    this.createdAt,
    this.v,
    this.signature,
  }) : super(
          id: id,
          note: note,
          comment: comment,
          deleted: deleted,
          status: status,
          isVehicleReturn: isVehicleReturn,
          isBooking: isBooking,
          blockTarif: blockTarif,
          dontWarrantyBooking: dontWarrantyBooking,
          blockVehicleUntilStart: blockVehicleUntilStart,
          info: info,
          customer: customer,
          search: search,
          vehicle: vehicle,
          driver: driver,
          reglement: reglement,
          sumReglement: sumReglement,
          rate: rate,
          historyReglement: historyReglement,
          commentaires: commentaires,
          numberContrat: numberContrat,
          createdBy: createdBy,
          createdAt: createdAt,
          v: v,
          signature: signature,
        );

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractModelToJson(this);
}
