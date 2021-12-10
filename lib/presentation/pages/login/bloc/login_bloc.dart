import 'package:bloc/bloc.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/domain/entities/login/login.dart';
import 'package:clicar/domain/usecases/login/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final FetchTokenUseCase fetchTokenUseCase;

  LoginBloc({required this.loginUseCase, required this.fetchTokenUseCase})
      : super(LoginInitial()) {
    on<UserCheckLoginStatusEvent>(_userCheckLoginStatusEvent);
    on<UserLoginEvent>(_userLoginEvent);
  }

  Future<void> _userCheckLoginStatusEvent(event, emit) async {
    emit(LoadingState());
    try {
      final result = await fetchTokenUseCase.call(TokenParams());
      result.fold(
        (failure) => emit(NotLoggedState()),
        (success) => emit(LoggedState(login: Login(token: success.token))),
      );
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }

  Future<void> _userLoginEvent(event, emit) async {
    emit(LoadingState());
    try {
      final result = await loginUseCase.call(
        LoginParams(
          username: event.username,
          password: event.password,
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
        (success) => emit(LoggedState(login: Login(token: success.token))),
      );
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }

  @override
  void onChange(Change<LoginState> change) {
    // TODO: implement onChange
    super.onChange(change);
    debugPrint("$change");
  }
}
