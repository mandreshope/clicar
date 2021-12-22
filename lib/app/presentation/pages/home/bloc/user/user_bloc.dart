import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:clicar/app/domain/usecases/user/me_usecase.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/di/injection_container.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final MeUseCase meUseCase;
  UserBloc({
    required this.meUseCase,
  }) : super(UserInitial()) {
    on<MeUserEvent>(_meEvent);
  }

  Future<void> _meEvent(MeUserEvent event, Emitter emit) async {
    emit(LoadingUserState());
    try {
      final result = await meUseCase(NoParams());
      result.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorUserState(message: 'No connextion error'));
          } else if (failure is ServerFailure) {
            if (failure.body.toString().contains("TokenExpiredError")) {
              sl.get<AuthBloc>().add(UserLogOutEvent());
              return;
            }
            emit(ErrorUserState(message: failure.message));
          } else {
            emit(const ErrorUserState(message: 'Unknown error'));
          }
        },
        (success) => emit(MeUserState(user: success)),
      );
    } catch (_) {
      emit(ErrorUserState(message: _.toString()));
    }
  }
}
