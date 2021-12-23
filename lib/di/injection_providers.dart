import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/home/home_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';
import 'package:provider/single_child_widget.dart';
import 'package:clicar/app/presentation/pages/account/bloc/user_info/user_info_bloc.dart';

/// inject providers
List<SingleChildWidget> providers = [
  BlocProvider(
      create: (context) => sl<AuthBloc>()..add(UserCheckLoginStatusEvent())),
  BlocProvider(create: (context) => sl<ForgotPasswordBloc>()),
  BlocProvider(create: (context) => sl<UserBloc>()),
  BlocProvider(
      create: (context) => sl<UserInfoBloc>()..add(OnInitUserInfoEvent())),
  BlocProvider(create: (context) => sl<HomeBloc>()..add(OnInitHomeEvent())),
];

class GlobalBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    //debugPrint('${bloc.runtimeType}\n');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    //debugPrint('${bloc.runtimeType}, $event\n');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    //debugPrint('${bloc.runtimeType}, $change\n');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('${bloc.runtimeType}, $transition\n');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    //debugPrint('${bloc.runtimeType}, $error\n');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('${bloc.runtimeType}\n');
  }
}
