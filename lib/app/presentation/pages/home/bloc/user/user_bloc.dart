import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/usecases/user/me_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:clicar/app/core/errors/message.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, BaseState> {
  final MeUseCase meUseCase;
  User? currentUser;
  UserBloc({
    required this.meUseCase,
  }) : super(const BaseState(status: Status.initial, message: 'UserInitial')) {
    on<MeUserEvent>(_meEvent);
  }

  Future<void> _meEvent(MeUserEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final result = await meUseCase(NoParams());
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
          currentUser = success;
          emit(MeUserState(
            user: success,
            status: Status.meUser,
            message: 'getMe has a value',
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }
}
