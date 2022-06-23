part of 'stat_bloc.dart';

class GetStatFlotteSuccessState extends BaseState {
  final GestionFlotteStat gestionFlotteStat;
  const GetStatFlotteSuccessState({
    required this.gestionFlotteStat,
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class GetStatEncaissementSuccessState extends BaseState {
  final EncaissementStat encaissementStat;
  const GetStatEncaissementSuccessState({
    required this.encaissementStat,
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class GetListVehicleStatSuccessState extends BaseState {
  final List<VehicleStat> vehicles;
  const GetListVehicleStatSuccessState({
    required this.vehicles,
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class GetVehicleStatSuccessState extends BaseState {
  final VehicleStatDetail statVehicle;
  const GetVehicleStatSuccessState({
    required this.statVehicle,
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class GetListVehicleLoadingState extends BaseState {
  const GetListVehicleLoadingState({
    required Status status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );
}
