import 'package:clicar/app/data/models/bdc/vehicle_booking_model.dart';
import 'package:clicar/app/data/models/contract/history_reglement_model.dart';
import 'package:clicar/app/data/models/contract/info_model.dart';
import 'package:clicar/app/data/models/contract/rate_model.dart';
import 'package:clicar/app/data/models/contract/search_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/user/user_model.dart';
import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:clicar/app/domain/entities/bdc/bdc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bdc_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BdcModel extends Bdc {
  final String? id;
  final bool? vehicleChecked;
  final String? note;
  final String? comment;
  final bool? deleted;
  final int? status;
  final bool? isVehicleReturn;
  final bool? isBooking;
  final bool? blockTarif;
  final bool? dontWarrantyBooking;
  final bool? blockVehicleUntilStart;
  final bool? cautionIsReturned;
  final bool? hasBeenTransformed;
  final bool? creanceMRC;
  final ContractInfoModel? info;
  final CustomerModel? customer;
  final SearchModel? search;
  final VehicleBookingModel? vehicleBooking;
  final List<dynamic>? reglement;
  final String? sumReglement;
  final RateModel? rate;
  final List<HistoryReglementModel>? historyReglement;
  final List<dynamic>? commentaires;
  final String? numberContrat;
  final UserModel? createdBy;
  final String? createdAt;
  final List<dynamic>? otherHistory;
  final int? v;
  final VehicleModel? vehicle;

  const BdcModel(
      {
      this.id,
      this.vehicleChecked,
      this.note,
      this.comment,
      this.deleted,
      this.status,
      this.isVehicleReturn,
      this.isBooking,
      this.blockTarif,
      this.dontWarrantyBooking,
      this.blockVehicleUntilStart,
      this.cautionIsReturned,
      this.hasBeenTransformed,
      this.creanceMRC,
      this.info,
      this.customer,
      this.search,
      this.vehicleBooking,
      this.reglement,
      this.sumReglement,
      this.rate,
      this.historyReglement,
      this.commentaires,
      this.numberContrat,
      this.createdBy,
      this.createdAt,
      this.otherHistory,
      this.v,
      this.vehicle
      })
      : super(
          id: id,
          vehicleChecked: vehicleChecked,
          note: note,
          comment: comment,
          deleted: deleted,
          status: status,
          isVehicleReturn: isVehicleReturn,
          isBooking: isBooking,
          blockTarif: blockTarif,
          dontWarrantyBooking: dontWarrantyBooking,
          blockVehicleUntilStart: blockVehicleUntilStart,
          cautionIsReturned: cautionIsReturned,
          hasBeenTransformed: hasBeenTransformed,
          creanceMRC: creanceMRC,
          info: info,
          customer: customer,
          search: search,
          vehicleBooking: vehicleBooking,
          reglement: reglement,
          sumReglement: sumReglement,
          rate: rate,
          historyReglement: historyReglement,
          commentaires: commentaires,
          numberContrat: numberContrat,
          createdBy: createdBy,
          createdAt: createdAt,
          otherHistory: otherHistory,
          vehicle: vehicle
        );

  factory BdcModel.fromJson(Map<String, dynamic> json) =>
      _$BdcModelFromJson(json);

  Map<String, dynamic> toJson() => _$BdcModelToJson(this);
}
