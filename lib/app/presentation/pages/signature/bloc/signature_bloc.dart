import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/usecases/contract/search_contract_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part './signature_event.dart';
part './signature_state.dart';

class SignatureBloc extends Bloc<SignatureEvent, BaseState> {
  final SearchContractUseCase searchContractUseCase;
  SignatureBloc({required this.searchContractUseCase})
      : super(const BaseState(status: Status.initial, message: "initial")) {
    on<SearchContractEvent>(_searchContractEvent,
        transformer: (Stream<SearchContractEvent> events, mapper) {
      return events.debounceTime(const Duration(seconds: 1)).switchMap(mapper);
    });
  }

  Future<void> _searchContractEvent(
      SearchContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final result = await searchContractUseCase(SearchContractParams(
        keyWord: event.keyWord,
      ));
      result.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorState(
                status: Status.error, message: 'No connextion error'));
          } else if (failure is ServerFailure) {
            emit(ErrorState(status: Status.error, message: failure.message));
          } else if (failure is TokenExpiredFailure) {
            emit(const ErrorState(
                status: Status.tokenExpired,
                message: 'token expired 🔑🔑🔑🔑🔑🪙🪙🔑🔑🔑'));
          } else {
            emit(const ErrorState(
                status: Status.error, message: 'Unknown error'));
          }
        },
        (success) {
          emit(SearchContractState(
              status: Status.success,
              message: 'search contract result',
              contracts: success));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }
}
