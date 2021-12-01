import 'package:bloc/bloc.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/domain/entities/login/login.dart';
import 'package:clicar/domain/usecases/login/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final FetchTokenUseCase fetchTokenUseCase;

  LoginBloc({required this.loginUseCase, required this.fetchTokenUseCase})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is UserCheckLoginStatusEvent) {
        emit(LoadingState());
        try {
          final result = await fetchTokenUseCase.call(TokenParams());
          result.fold(
            (failure) => emit(NotLoggedState()),
            (success) => emit(LoggedState(login: Login(token: success.token))),
          );
        } catch (_) {
          emit(const ErrorState(message: 'LOGGING_ERROR'));
        }
      } else if (event is UserLoginEvent) {
        emit(LoadingState());
        try {
          final result = await loginUseCase.call(
            LoginParams(
              email: event.email,
              password: event.password,
            ),
          );
          result.fold(
            (failure) {
              if (failure is NoConnectionFailure) {
                emit(const ErrorState(message: 'NO_CONNECTION_ERROR'));
              } else {
                emit(const ErrorState(message: "LOGGING_ERROR"));
              }
            },
            (success) => emit(LoggedState(login: Login(token: success.token))),
          );
        } catch (_) {
          emit(const ErrorState(message: 'LOGGING_ERROR'));
        }
      } else if (event is UserSkipLoginEvent) {
        emit(
          const LoggedState(
            login: Login(token: "111111111111111111111111"),
          ),
        );
      }
    });
  }
}
