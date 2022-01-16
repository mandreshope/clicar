import 'package:clicar/app/data/models/contract/condition_at_start_model.dart';
import 'package:clicar/app/domain/entities/contract/condition_at_end.dart';
import 'package:clicar/app/domain/entities/contract/condition_at_start.dart';
import 'package:clicar/app/domain/entities/contract/history_reglement.dart';
import 'package:clicar/app/domain/entities/contract/info.dart';
import 'package:clicar/app/domain/entities/contract/rate.dart';
import 'package:clicar/app/domain/entities/contract/reglement.dart';
import 'package:clicar/app/domain/entities/contract/search.dart';
import 'package:clicar/app/domain/entities/contract/signature.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';

class Contract extends Equatable {
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
  final ContractInfo? info;
  final Customer? customer;
  final Search? search;
  final Vehicle? vehicle;
  final Driver? driver;
  final List<Reglement>? reglement;
  final String? sumReglement;
  final Rate? rate;
  final List<HistoryReglement>? historyReglement;
  final List<dynamic>? commentaires;
  final String? numberContrat;
  final String? createdBy;
  final String? createdAt;
  final int? v;
  final Signature? signature;
  final ConditionAtStart? conditionAtStart;
  final ConditionAtEnd? conditionAtEnd;

  const Contract({
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
    this.conditionAtStart,
    this.conditionAtEnd,
  });

  @override
  List<Object?> get props => [
        id,
        note,
        comment,
        deleted,
        status,
        isVehicleReturn,
        isBooking,
        blockTarif,
        dontWarrantyBooking,
        blockVehicleUntilStart,
        info,
        customer,
        search,
        vehicle,
        driver,
        reglement,
        sumReglement,
        rate,
        historyReglement,
        commentaires,
        numberContrat,
        createdBy,
        createdAt,
        v,
        signature,
        conditionAtStart,
        conditionAtEnd
      ];
}
