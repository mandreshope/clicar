import 'package:clicar/app/core/routes/app_pages.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthListenerWidget extends StatelessWidget {
  final Widget child;
  const AuthListenerWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, BaseState>(
      listener: (context, state) {
        if (state.status == Status.notLogged) {
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.login, (route) => false);
          });
        }
      },
      child: child,
    );
  }
}
