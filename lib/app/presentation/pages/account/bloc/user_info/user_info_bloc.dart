import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/message.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/usecases/user/user_info_update_usecase.dart';
import 'package:equatable/equatable.dart';

part './user_info_event.dart';
part './user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, BaseState> {
  final UserInfoUpdateUseCase userInfoUpdateUseCase;
  UserInfoBloc({
    required this.userInfoUpdateUseCase,
  }) : super(const BaseState(
            status: Status.initial, message: 'userInfoBloc init')) {
    on<UserInfoUpdateEvent>(_userInfoUpdateEvent);
    on<OnInitUserInfoEvent>(_onInitUserInfoEvent);
  }

  Future<void> _onInitUserInfoEvent(OnInitUserInfoEvent event, emit) async {
    emit(const BaseState(status: Status.initial, message: 'userInfoBloc init'));
  }

  Future<void> _userInfoUpdateEvent(UserInfoUpdateEvent event, emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final result = await userInfoUpdateUseCase(
        UserInfoUpdateParams(
          username: event.username,
          email: event.email,
          lastName: event.lastName,
          firstName: event.firstName,
          role: event.role,
          deleted: event.deleted,
          id: event.id,
        ),
      );
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
          emit(UserInfoUpdatedState(
            user: success,
            message: "user info mis à jour avec succès",
            status: Status.userInfoUpdated,
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(message: unknownError, status: Status.error));
    }
  }
}
