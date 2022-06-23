import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/errors/message.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/statistique/encaissement_stat/encaissement_stat.dart';
import 'package:clicar/app/domain/entities/statistique/gestion_flotte_stat/gestion_flotte_stat.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat_detail.dart';
import 'package:clicar/app/domain/usecases/statistique/get_list_vehicle_stat_usecase.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_encaissement_usecase.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_flotte_usecase.dart';
import 'package:clicar/app/domain/usecases/statistique/get_vehicle_stat_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stat_event.dart';
part 'stat_state.dart';

class StatBloc extends Bloc<StatEvent, BaseState> {
  final GetStatFlotteUseCase getStatFlotteUseCase;
  final GetStatEncaissementUseCase getStatEncaissementUseCase;
  final GetListVehicleStatUseCase getListVehicleStatUseCase;
  final GetVehicleStatUseCase getVehicleStatUseCase;
  StatBloc({
    required this.getStatFlotteUseCase,
    required this.getStatEncaissementUseCase,
    required this.getListVehicleStatUseCase,
    required this.getVehicleStatUseCase,
  }) : super(const BaseState(status: Status.initial, message: "initial")) {
    on<GetStatFlotteEvent>(_getStatFlotteEvent);
    on<GetStatEncaissementEvent>(_getStatEncaissementEvent);
    on<GetListVehicleStatEvent>(_getListVehicleStatEvent);
    on<GetVehicleStatEvent>(_getVehicleStatEvent);
  }

  Future<void> _getStatFlotteEvent(
      GetStatFlotteEvent event, Emitter emit) async {
    debugPrint("data = ${event.data}");
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    final result =
        await getStatFlotteUseCase(GetStatFlotteParams(data: event.data));
    result.fold(
      (failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(
              status: Status.error, message: noConnexionMessage));
        } else if (failure is ServerFailure) {
          emit(const ErrorState(status: Status.error, message: serverError));
        } else if (failure is TokenExpiredFailure) {
          emit(const ErrorState(
              status: Status.tokenExpired, message: tokenExpired));
        } else {
          emit(const ErrorState(status: Status.error, message: unknownError));
        }
      },
      (success) {
        emit(GetStatFlotteSuccessState(
          gestionFlotteStat: success,
          status: Status.success,
          message: "",
        ));
      },
    );
  }

  Future<void> _getStatEncaissementEvent(
      GetStatEncaissementEvent event, Emitter emit) async {
    debugPrint("data = ${event.data}");
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    final result =
        await getStatEncaissementUseCase(GetStatFlotteParams(data: event.data));
    result.fold(
      (failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(
              status: Status.error, message: noConnexionMessage));
        } else if (failure is ServerFailure) {
          emit(const ErrorState(status: Status.error, message: serverError));
        } else if (failure is TokenExpiredFailure) {
          emit(const ErrorState(
              status: Status.tokenExpired, message: tokenExpired));
        } else {
          emit(const ErrorState(status: Status.error, message: unknownError));
        }
      },
      (success) {
        emit(GetStatEncaissementSuccessState(
          encaissementStat: success,
          status: Status.success,
          message: "",
        ));
      },
    );
  }

  Future<void> _getListVehicleStatEvent(
      GetListVehicleStatEvent event, Emitter emit) async {
    emit(const GetListVehicleLoadingState(status: Status.loading, message: 'loading ⌛'));
    final result =
        await getListVehicleStatUseCase(NoParams());
    result.fold(
      (failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(
              status: Status.error, message: noConnexionMessage));
        } else if (failure is ServerFailure) {
          emit(const ErrorState(status: Status.error, message: serverError));
        } else if (failure is TokenExpiredFailure) {
          emit(const ErrorState(
              status: Status.tokenExpired, message: tokenExpired));
        } else {
          emit(const ErrorState(status: Status.error, message: unknownError));
        }
      },
      (success) {
        emit(GetListVehicleStatSuccessState(
          vehicles: success,
          status: Status.success,
          message: "",
        ));
      },
    );
  }

  Future<void> _getVehicleStatEvent(
      GetVehicleStatEvent event, Emitter emit) async {
    debugPrint("data = ${event.data}");
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    final result =
        await getVehicleStatUseCase(GetStatFlotteParams(data: event.data));
    result.fold(
      (failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(
              status: Status.error, message: noConnexionMessage));
        } else if (failure is ServerFailure) {
          emit(const ErrorState(status: Status.error, message: serverError));
        } else if (failure is TokenExpiredFailure) {
          emit(const ErrorState(
              status: Status.tokenExpired, message: tokenExpired));
        } else {
          emit(const ErrorState(status: Status.error, message: unknownError));
        }
      },
      (success) {
        emit(GetVehicleStatSuccessState(
          statVehicle: success,
          status: Status.success,
          message: "",
        ));
      },
    );
  }
}
