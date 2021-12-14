import 'package:clicar/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/presentation/pages/home/bloc/user_bloc.dart';
import 'package:clicar/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';
import 'package:provider/single_child_widget.dart';
import 'package:clicar/presentation/pages/account/bloc/user_info/user_info_bloc.dart';

/// providers
List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => sl<AuthBloc>()),
  BlocProvider(create: (context) => sl<ForgotPasswordBloc>()),
  BlocProvider(create: (context) => sl<UserBloc>()),
  BlocProvider(create: (context) => sl<UserInfoBloc>()),
];
