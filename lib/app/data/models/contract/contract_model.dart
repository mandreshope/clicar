import 'package:clicar/app/data/models/contract/info_model.dart';
import 'package:clicar/app/data/models/contract/rate_model.dart';
import 'package:clicar/app/data/models/contract/reglement_model.dart';
import 'package:clicar/app/data/models/contract/search_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/driver/driver_model.dart';
import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'history_reglement_model.dart';

part 'contract_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractModel {
  String? id;
  String? note;
  String? comment;
  bool? deleted;
  int? status;
  bool? isVehicleReturn;
  bool? isBooking;
  bool? blockTarif;
  bool? dontWarrantyBooking;
  bool? blockVehicleUntilStart;
  ContractInfoModel? info;
  CustomerModel? customer;
  SearchModel? search;
  VehicleModel? vehicle;
  DriverModel? driver;
  List<ReglementModel>? reglement;
  String? sumReglement;
  RateModel? rate;
  List<HistoryReglementModel>? historyReglement;
  List<dynamic>? commentaires;
  String? numberContrat;
  String? createdBy;
  String? createdAt;
  int? v;

  ContractModel({
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
  });

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractModelToJson(this);
}
