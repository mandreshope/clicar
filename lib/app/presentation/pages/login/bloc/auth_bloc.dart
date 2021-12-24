import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/app/core/usecases/usecase.dart';
import 'package:clicar/app/domain/usecases/auth/login_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/logout_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/register_usecase.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, BaseState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final FetchTokenUseCase fetchTokenUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({
    required this.logoutUseCase,
    required this.loginUseCase,
    required this.fetchTokenUseCase,
    required this.registerUseCase,
  }) : super(const BaseState(
            status: Status.loginInitial, message: "loginInitial")) {
    on<UserCheckLoginStatusEvent>(_userCheckLoginStatusEvent);
    on<UserLoginEvent>(_userLoginEvent);
    on<UserLogOutEvent>(_userLogOutEvent);
    on<UserRegisterEvent>(_userRegisterEvent);
  }

  Future<void> _userCheckLoginStatusEvent(
      UserCheckLoginStatusEvent event, emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading...'));
    try {
      final result = await fetchTokenUseCase(TokenParams());
      result.fold(
        (failure) {
          emit(const BaseState(
              status: Status.notLogged, message: 'notLogged 😢'));
        },
        (success) {
          emit(const BaseState(
              status: Status.logged, message: 'user logged 😊'));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _userLoginEvent(UserLoginEvent event, emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final result = await loginUseCase(
        LoginParams(
          username: event.username,
          password: event.password,
        ),
      );
      result.fold((failure) {
        if (failure is NoConnectionFailure) {
          emit(const ErrorState(
              status: Status.error, message: 'No connextion error'));
        } else if (failure is ServerFailure) {
          emit(ErrorState(status: Status.error, message: failure.message));
        } else {
          emit(
              const ErrorState(status: Status.error, message: 'Unknown error'));
        }
      }, (success) {
        emit(const BaseState(status: Status.logged, message: 'user logged 😊'));
      });
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _userRegisterEvent(event, emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
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
          emit(const ErrorState(
              status: Status.error, message: 'No connextion error'));
        } else if (failure is ServerFailure) {
          emit(ErrorState(status: Status.error, message: failure.message));
        } else {
          emit(
              const ErrorState(status: Status.error, message: 'Unknown error'));
        }
      }, (success) {
        emit(const BaseState(status: Status.logged, message: 'user logged 😊'));
      });
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _userLogOutEvent(UserLogOutEvent event, emit) async {
    await logoutUseCase(NoParams());
    emit(const BaseState(status: Status.notLogged, message: 'notLogged 😢'));
  }

  @override
  void onChange(Change<BaseState> change) {
    super.onChange(change);
    /* debugPrint("$change");*/
  }

  @override
  void onTransition(Transition<AuthEvent, BaseState> transition) {
    super.onTransition(transition);
    /* debugPrint("$transition");*/
  }
}
