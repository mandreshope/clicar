import 'package:clicar/app/data/models/contract/contract_created_by_serialiser.dart';
import 'package:clicar/app/data/models/contract/contract_customer_serialiser.dart';
import 'package:clicar/app/data/models/contract/history_reglement_model.dart';
import 'package:clicar/app/data/models/contract/info_diver_model.dart';
import 'package:clicar/app/data/models/contract/info_model.dart';
import 'package:clicar/app/data/models/contract/rate_model.dart';
import 'package:clicar/app/data/models/contract/reglement_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/driver/driver_model.dart';
import 'package:clicar/app/data/models/user/user_model.dart';
import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReservationModel extends Reservation {
  final String? id;
  final String? note;
  final String? comment;
  final bool? deleted;
  final int? status;
  final List<dynamic>? commentaires;
  @ContractCustomerSerialiser()
  final CustomerModel? customer;
  final String? description;
  final DriverModel? driver;
  final VehicleModel? vehicle;
  final ContractInfoModel? info;
  final InfoDiverModel? infoDivers;
  final String? numberReservation;
  final String? typeReservation;
  final RateModel? rate;
  final List<ReglementModel>? reglementList;
  final List<HistoryReglementModel>? historyReglement;
  @ContractCreatedBySerialiser()
  final UserModel? createdBy;
  final String? createdAt;
  final int? v;
  final UserModel? updateBy;
  const ReservationModel(
      {this.id,
      this.note,
      this.comment,
      this.deleted,
      this.status,
      this.commentaires,
      this.customer,
      this.description,
      this.driver,
      this.vehicle,
      this.info,
      this.infoDivers,
      this.numberReservation,
      this.typeReservation,
      this.rate,
      this.reglementList,
      this.historyReglement,
      this.createdBy,
      this.createdAt,
      this.v,
      this.updateBy})
      : super(
          id: id,
          note: note,
          comment: comment,
          deleted: deleted,
          status: status,
          commentaires: commentaires,
          customer: customer,
          description: description,
          driver: driver,
          vehicule: vehicle,
          info: info,
          infoDivers: infoDivers,
          numberReservation: numberReservation,
          typeReservation: typeReservation,
          rate: rate,
          reglementList: reglementList,
          historyReglement: historyReglement,
          createdBy: createdBy,
          createdAt: createdAt,
          v: v,
          updateBy: updateBy
        );

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationModelToJson(this);
}
