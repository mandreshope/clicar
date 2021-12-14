import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/usecases/auth/me_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final MeUseCase meUseCase;
  UserBloc({
    required this.meUseCase,
  }) : super(UserInitial()) {
    on<MeEvent>(_meEvent);
  }

  Future<void> _meEvent(MeEvent event, Emitter emit) async {
    emit(LoadingState());
    try {
      final result = await meUseCase(NoParams());
      result.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorState(message: 'No connextion error'));
          } else if (failure is ServerFailure) {
            emit(ErrorState(message: failure.message));
          } else {
            emit(const ErrorState(message: 'Unknown error'));
          }
        },
        (success) => emit(MeState(user: success)),
      );
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }
}
