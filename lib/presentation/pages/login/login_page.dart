import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              debugPrint("$logTrace intial state: $state");
              return TextButton(
                onPressed: () {
                  context.read<LoginBloc>().add(const UserLoginEvent(
                        email: "mandreshope@gmail.com",
                        password: "123456",
                      ));
                },
                child: const Text("click here..."),
              );
            },
          ),
        ),
      ),
    );
  }
}
