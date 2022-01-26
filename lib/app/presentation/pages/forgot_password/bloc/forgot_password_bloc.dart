import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/domain/usecases/auth/change_password_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:clicar/app/core/errors/message.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  ForgotPasswordBloc({
    required this.forgotPasswordUseCase,
    required this.changePasswordUseCase,
  }) : super(ForgotPasswordInitial()) {
    on<UserForgotPasswordEvent>(_userForgotPasswordEvent);
    on<ChangePasswordEvent>(_changePasswordEvent);
  }

  Future<void> _userForgotPasswordEvent(
      UserForgotPasswordEvent event, emit) async {
    emit(LoadingState());
    try {
      final result = await forgotPasswordUseCase(
        ForgotPasswordParams(
          email: event.email,
        ),
      );
      result.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorState(message: noConnexionMessage));
          } else if (failure is ServerFailure) {
            emit(ErrorState(message: failure.message));
          } else {
            emit(const ErrorState(message: unknownError));
          }
        },
        (success) => emit(VerificationCodeSentState()),
      );
    } catch (_) {
      emit(ErrorState(message: unknownError));
    }
  }

  Future<void> _changePasswordEvent(ChangePasswordEvent event, emit) async {
    emit(LoadingState());
    try {
      final result = await changePasswordUseCase(
        ChangePasswordParams(
          email: event.email,
          code: event.code,
          password: event.password,
        ),
      );
      result.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorState(message: noConnexionMessage));
          } else if (failure is ServerFailure) {
            emit(ErrorState(message: failure.message));
          } else {
            emit(const ErrorState(message: unknownError));
          }
        },
        (success) => emit(PasswordChangedState()),
      );
    } catch (_) {
      emit(ErrorState(message: unknownError));
    }
  }

  @override
  void onTransition(
      Transition<ForgotPasswordEvent, ForgotPasswordState> transition) {
    super.onTransition(transition);
    debugPrint("$transition");
  }
}
