import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/app/core/utils/extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, BaseState>(
      listenWhen: (prev, next) {
        return next.status == Status.notLogged || next.status == Status.logged;
      },
      listener: (context, state) {
        print("#### STATE CHANGED");
        if (state.status == Status.logged) {
          print(">>>>>>>>>>>>>>>>>>>>> LOGGED");
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
            arguments: "coucouc",
          );
          /* WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.home, (route) => false);
          });*/
        } else {
          print(">>>>>>>>>>>>>>>>>>>>>NOT LOGGED");
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.login, (route) => false);
          /* WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.login, (route) => false);
          });*/
        }
      },
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        body: Column(
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
        ),
      ),
    );
  }
}
