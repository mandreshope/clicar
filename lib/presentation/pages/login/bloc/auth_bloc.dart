import 'package:bloc/bloc.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/domain/entities/auth/login.dart';
import 'package:clicar/domain/usecases/auth/login_usecase.dart';
import 'package:clicar/domain/usecases/auth/logout_usecase.dart';
import 'package:clicar/domain/usecases/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final FetchTokenUseCase fetchTokenUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({
    required this.logoutUseCase,
    required this.loginUseCase,
    required this.fetchTokenUseCase,
    required this.registerUseCase,
  }) : super(LoginInitial()) {
    on<UserCheckLoginStatusEvent>(_userCheckLoginStatusEvent);
    on<UserLoginEvent>(_userLoginEvent);
    on<UserLogOutEvent>(_userLogOutEvent);
    on<UserRegisterEvent>(_userRegisterEvent);
  }

  Future<void> _userCheckLoginStatusEvent(
      UserCheckLoginStatusEvent event, emit) async {
    emit(LoadingState());
    try {
      final result = await fetchTokenUseCase(TokenParams());
      result.fold(
        (failure) => emit(NotLoggedState()),
        (success) {
          debugPrint("$logTrace token : ${success.token}");
          emit(LoggedState(login: Login(token: success.token)));
        },
      );
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }

  Future<void> _userLoginEvent(UserLoginEvent event, emit) async {
    emit(LoadingState());
    try {
      final result = await loginUseCase(
        LoginParams(
          username: event.username,
          password: event.password,
        ),
      );
      result.fold((failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(message: 'No connextion error'));
        } else if (failure is ServerFailure) {
          emit(ErrorState(message: failure.message));
        } else {
          emit(const ErrorState(message: 'Unknown error'));
        }
      }, (success) {
        emit(LoggedState(login: Login(token: success.token)));
      });
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }

  Future<void> _userRegisterEvent(event, emit) async {
    emit(LoadingState());
    try {
      final result = await registerUseCase(RegisterParams(
        username: event.username,
        email: event.email,
        password: event.password,
        lastName: event.lastName,
        firstName: event.firstName,
        role: "Admin", // TODO: ROLE STATIC
      ));
      result.fold((failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(message: 'No connextion error'));
        } else if (failure is ServerFailure) {
          emit(ErrorState(message: failure.message));
        } else {
          emit(const ErrorState(message: 'Unknown error'));
        }
      }, (success) {
        emit(LoggedState(login: Login(token: success.token)));
      });
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }

  Future<void> _userLogOutEvent(UserLogOutEvent event, emit) async {
    await logoutUseCase(NoParams());
    emit(NotLoggedState());
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    /* debugPrint("$change");*/
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    debugPrint("$transition");
  }
}
