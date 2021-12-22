import 'package:clicar/app/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/home/home_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
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
