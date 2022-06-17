import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/errors/message.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/domain/entities/statistique/gestion_flotte_stat/gestion_flotte_stat.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_flotte_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stat_event.dart';
part 'stat_state.dart';

class StatBloc extends Bloc<StatEvent, BaseState> {
  final GetStatFlotteUseCase getStatFlotteUseCase;
  StatBloc({required this.getStatFlotteUseCase})
      : super(const BaseState(status: Status.initial, message: "initial")) {
    on<GetStatFlotteEvent>(_getStatFlotteEvent);
  }

  Future<void> _getStatFlotteEvent(
      GetStatFlotteEvent event, Emitter emit) async {
    // var data = {
    //   "filter": "month",
    //   "month": "2022-06",
    //   "filtreRangeBegin": "2022-06-15",
    //   "filtreRangeEnd": "2022-07-15",
    //   "day": "2022-06-15",
    //   "week": "2022-W25"
    // };
    Map<String, dynamic> data = {
      "filter": "month",
      "month": "2022-06",
      "filtreRangeBegin": "2022-06-15",
      "filtreRangeEnd": "2022-07-15",
      "day": "2022-06-15",
      "week": "2022-W25"
    };
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    final result = await getStatFlotteUseCase(GetStatFlotteParams(data: data));
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
}
