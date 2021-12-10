import 'package:clicar/core/routes/app_pages.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/pages/login/bloc/login_bloc.dart';
import 'package:clicar/presentation/widgets/circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/core/utils/extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoggedState) {
              WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.home, (route) => false);
              });
            } else {
              WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.login, (route) => false);
              });
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${assetsImages}clicar_logo.png",
                  scale: 5.sp(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgress(
                      color: Colors.white,
                      strokeWidth: 2.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Chargement...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: CustomTheme.bodyText2.sp(context),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
