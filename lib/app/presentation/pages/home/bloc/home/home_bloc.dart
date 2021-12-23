import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState> {
  HomeBloc()
      : super(
            const BaseState(status: Status.initial, message: "homeBloc init")) {
    on<OnInitHomeEvent>(_onInitHomeEvent);
    on<OnReadyHomeEvent>(_onReadyHomeEvent);
  }

  Future<void> _onInitHomeEvent(OnInitHomeEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.initial, message: "homeBloc init"));
  }

  Future<void> _onReadyHomeEvent(OnReadyHomeEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.initial, message: "homeBloc init"));
  }
}
