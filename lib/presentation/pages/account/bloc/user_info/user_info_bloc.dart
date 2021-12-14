import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/usecases/user/user_info_update_usecase.dart';
import 'package:equatable/equatable.dart';

part './user_info_event.dart';
part './user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoUpdateUseCase userInfoUpdateUseCase;
  UserInfoBloc({
    required this.userInfoUpdateUseCase,
  }) : super(UserInfoInitial()) {
    on<UserInfoUpdateEvent>(_userInfoUpdateEvent);
  }

  Future<void> _userInfoUpdateEvent(UserInfoUpdateEvent event, emit) async {
    emit(LoadingState());
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
            emit(const ErrorState(message: 'No connextion error'));
          } else if (failure is ServerFailure) {
            emit(ErrorState(message: failure.message));
          } else {
            emit(const ErrorState(message: 'Unknown error'));
          }
        },
        (success) => emit(UserInfoUpdatedState(user: success)),
      );
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }
}
