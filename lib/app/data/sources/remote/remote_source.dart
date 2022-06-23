import 'dart:io';

import 'package:clicar/app/data/models/auth/forgot_password_model.dart';
import 'package:clicar/app/data/models/auth/login_model.dart';
import 'package:clicar/app/data/models/auth/register_model.dart';
import 'package:clicar/app/data/models/bdc/bdc_model.dart';
import 'package:clicar/app/data/models/contract/contract_model.dart';
import 'package:clicar/app/data/models/contravention/contravention_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/driver/driver_model.dart';
import 'package:clicar/app/data/models/reservation/reservation_model.dart';
import 'package:clicar/app/data/models/statistique/contract_stat/contract_stat_model.dart';
import 'package:clicar/app/data/models/statistique/encaissement_stat/encaissement_stat_model.dart';
import 'package:clicar/app/data/models/statistique/gestion_flotte_stat/gestion_flotte_stat_model.dart';
import 'package:clicar/app/data/models/statistique/sale_turnover/sale_turnover_model.dart';
import 'package:clicar/app/data/models/statistique/vehicle_stat/vehicle_stat_detail_model.dart';
import 'package:clicar/app/data/models/statistique/vehicle_stat/vehicle_stat_model.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/data/models/user/user_model.dart';
import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/sign_reservation_usecase.dart';

abstract class RemoteSource {
  Future<LoginModel> login({
    required String username,
    required String password,
  });
  Future<RegisterModel> register({
    required String username,
    required String email,
    required String password,
    required String lastName,
    required String firstName,
    required String role,
  });
  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  });
  Future<UserModel> changePassword({
    required String email,
    required String code,
    required String password,
  });
  Future<UserModel> me();
  Future<UserModel> userInfoUpdate({
    required String role,
    required bool deleted,
    required String id,
    required String lastName,
    required String firstName,
    required String username,
    required String email,
  });
  Future<List<ContractModel>> searchContract({
    required keyWord,
    required bool isSigned,
    bool? hasStartingEdl,
    bool? hasEndingEdl,
  });
  Future<UploadFileModel> uploadSingleFile(
      {required File file, required String fileDestination});
  Future<List<UploadFileModel>> uploadMultiFile(
      {required List<File> files, required String fileDestination});
  Future<ContractModel> signContract(
      {required SignContractParams signContractParams});
  Future<UploadFileModel> getPdfContract({required Contract contract});
  Future<bool> userAddPhoto({
    required String photo,
    required String id,
  });
  Future<bool> userChangePassword({
    required String newPassword,
    required String password,
    required String id,
  });
  Future<ContractModel> edlDeparture({required Map<String, dynamic> data});
  Future<ContractModel> edlRetour({required Map<String, dynamic> data});
  Future<CustomerModel> customerUpdate({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<DriverModel> driverUpdate({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<VehicleModel> vehicleUpdate({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<List<CustomerModel>> searchCustomer({required String filter});
  Future<List<DriverModel>> searchDriver({required String filter});
  Future<List<VehicleModel>> searchVehicle(
      {required Map<String, dynamic> filters});
  Future<List<ContraventionModel>> searchContravention(
      {required String filter});

  Future<List<ReservationModel>> searchReservation({required String filter});

  Future<List<BdcModel>> searchBdc({required String filter});
  Future<File> downloadFile({required String path, required String fileName});
  Future<UploadFileModel> getPdfReservation({required String reservationId});
  Future<UploadFileModel> getPdfBdc({required String bdcId});
  Future<Reservation> signReservation(
      {required SignReservationParams signReservationParams});
  Future<SaleTurnoverModel> getStatSaleTurnover(
      {required Map<String, dynamic> data});
  Future<EncaissementStatModel> getStatEncaissement(
      {required Map<String, dynamic> data});
  Future<GestionFlotteStatModel> getStatFlotte(
      {required Map<String, dynamic> data});
  Future<List<VehicleStatModel>> getListStatVehicle();
  Future<VehicleStatDetailModel> getStatVehicle({required Map<String, dynamic> data});
  Future<ContractStatModel> getStatContract(
      {required Map<String, dynamic> data});
}
