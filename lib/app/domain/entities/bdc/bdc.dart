import 'package:clicar/app/domain/entities/bdc/vehicle_booking.dart';
import 'package:clicar/app/domain/entities/contract/history_reglement.dart';
import 'package:clicar/app/domain/entities/contract/info.dart';
import 'package:clicar/app/domain/entities/contract/info_diver.dart';
import 'package:clicar/app/domain/entities/contract/rate.dart';
import 'package:clicar/app/domain/entities/contract/reglement.dart';
import 'package:clicar/app/domain/entities/contract/search.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';

class Bdc extends Equatable {
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
  final String? id;
  final ContractInfo? info;
  final Customer? customer;
  final Search? search;
  final VehicleBooking? vehicleBooking;
  final List<dynamic>? reglement;
  final String? sumReglement;
  final Rate? rate;
  final List<HistoryReglement>? historyReglement;
  final List<dynamic>? commentaires;
  final String? numberContrat;
  final User? createdBy;
  final String? createdAt;
  final List<dynamic>? otherHistory;
  final Vehicle? vehicle;
  final int? v;

  const Bdc(
      {this.vehicleChecked, //
      this.note, //
      this.comment, //
      this.deleted, //
      this.status,
      this.isVehicleReturn,
      this.isBooking, //
      this.blockTarif,
      this.dontWarrantyBooking,
      this.blockVehicleUntilStart,
      this.cautionIsReturned,
      this.creanceMRC,
      this.hasBeenTransformed,
      this.id,
      this.info,
      this.commentaires, //
      this.customer, //
      this.search,
      this.vehicleBooking,
      this.reglement,
      this.sumReglement,
      this.rate, //
      this.historyReglement, //
      this.numberContrat,
      this.createdBy, //
      this.createdAt, //
      this.v,
      this.otherHistory, //
      this.vehicle
      });

  @override
  List<Object?> get props => [
        vehicleChecked, //
        note, //
        comment, //
        deleted, //
        status,
        isVehicleReturn,
        isBooking, //
        blockTarif,
        dontWarrantyBooking,
        blockVehicleUntilStart,
        cautionIsReturned,
        creanceMRC,
        hasBeenTransformed,
        id,
        info,
        commentaires, //
        customer, //
        search,
        vehicleBooking,
        reglement,
        sumReglement,
        rate, //
        historyReglement, //
        numberContrat,
        createdBy, //
        createdAt, //
        v,
        otherHistory, //
        vehicle,
      ];
}
