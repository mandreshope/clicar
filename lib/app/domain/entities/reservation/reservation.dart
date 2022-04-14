import 'package:clicar/app/domain/entities/contract/history_reglement.dart';
import 'package:clicar/app/domain/entities/contract/info.dart';
import 'package:clicar/app/domain/entities/contract/info_diver.dart';
import 'package:clicar/app/domain/entities/contract/rate.dart';
import 'package:clicar/app/domain/entities/contract/reglement.dart';
import 'package:clicar/app/domain/entities/customer/customer.dart';
import 'package:clicar/app/domain/entities/driver/driver.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  final String? id;
  final String? note;
  final String? comment;
  final bool? deleted;
  final int? status;
  final List<dynamic>? commentaires;
  final Customer? customer;
  final String? description;
  final Driver? driver;
  final Vehicle? vehicule;
  final ContractInfo? info;
  final InfoDiver? infoDivers;
  final String? numberReservation;
  final String? typeReservation;
  final Rate? rate;
  final List<Reglement>? reglementList;
  final List<HistoryReglement>? historyReglement;
  final User? createdBy;
  final String? createdAt;
  final int? v;
  final User? updateBy;

  const Reservation({
    this.id, //
    this.note, //
    this.comment, // 
    this.deleted, //
    this.status, //
    this.commentaires, // 
    this.customer, // 
    this.description, //
    this.driver, // 
    this.vehicule, // 
    this.info, //
    this.infoDivers, //
    this.numberReservation, //
    this.typeReservation, //
    this.rate, //
    this.reglementList, //
    this.historyReglement, //
    this.createdBy, //
    this.createdAt, //
    this.v, //
    this.updateBy, //
  });

  @override
  List<Object?> get props => [
        id,
        note,
        comment,
        deleted,
        status,
        commentaires,
        customer,
        description,
        driver,
        vehicule,
        info,
        infoDivers,
        numberReservation,
        typeReservation,
        rate,
        reglementList,
        historyReglement,
        createdBy,
        createdAt,
        v,
        updateBy,
      ];
}
