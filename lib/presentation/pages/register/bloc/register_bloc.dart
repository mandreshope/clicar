import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/usecases/register/register_usecase.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterEvent>(_userRegisterEvent);
  }

  Future<void> _userRegisterEvent(event, emit) async {
    emit(LoadingState());
    try {
      final result = await registerUseCase.call(RegisterParams(
        username: event.username,
        email: event.email,
        password: event.password,
        lastName: event.lastName,
        firstName: event.firstName,
        role: "Admin", // TODO: ROLE STATIC
      ));
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
        (success) => emit(RegisteredState(user: success)),
      );
    } catch (_) {
      emit(ErrorState(message: _.toString()));
    }
  }
}
