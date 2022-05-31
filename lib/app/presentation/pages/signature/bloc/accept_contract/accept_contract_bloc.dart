import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:equatable/equatable.dart';

part './accept_contract_event.dart';
part './accept_contract_state.dart';

class AcceptContractBloc extends Bloc<AcceptEvent, BaseState> {
  AcceptContractBloc()
      : super(const BaseState(status: Status.initial, message: "initial")) {
    on<AcceptContractEvent>(_acceptContractEvent);
    on<AcceptParapheEvent>(_acceptParapheEvent);
  }

  bool isAcceptContract = false;
  bool isAcceptParah = false;

  Future<void> _acceptContractEvent(
      AcceptContractEvent event, Emitter emit) async {
    isAcceptContract = event.isAccepted;
    emit(AcceptContractState(
      isAccepted: event.isAccepted,
      status:
          event.isAccepted ? Status.contractAccepted : Status.contractRefused,
      message: event.isAccepted ? 'Accepted contract' : 'Refused contract',
    ));
  }

  Future<void> _acceptParapheEvent(
      AcceptParapheEvent event, Emitter emit) async {
    isAcceptParah = event.isAccepted;
    emit(AcceptParapheState(
      isAccepted: event.isAccepted,
      status:
          event.isAccepted ? Status.contractAccepted : Status.contractRefused,
      message: event.isAccepted ? 'Accepted contract' : 'Refused contract',
    ));
  }
}
