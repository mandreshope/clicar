import 'package:clicar/core/routes/app_pages.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/blocs/login/login_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/core/utils/extension.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: CustomTheme.primaryColor,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: Responsive.height(context) -
                        (Responsive.height(context) * 0.5),
                    child: Center(
                      child: Image.asset(
                        "${assetsImages}clicar_logo.png",
                        scale: 5.sp(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: CustomTheme.radius,
                      topRight: CustomTheme.radius,
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 05.h(context).sp(context),
                            horizontal: 10.w(context).sp(context),
                          ),
                          child: Column(
                            children: [
                              const TitleWithSeparator(title: "Connexion"),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextFieldFilled(
                                labelText: 'Utilisateur',
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              const TextFieldFilled(
                                labelText: 'Mot de passe',
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              PrimaryButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.home,
                                    arguments: "args",
                                  );
                                },
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    fontSize: CustomTheme.button.sp(context),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.forgotPassword,
                                  );
                                },
                                child: Text(
                                  "Mot de passe oublié ?",
                                  style: TextStyle(
                                    color: CustomTheme.primaryColor,
                                    fontSize: CustomTheme.bodyText1.sp(context),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.register,
                                  );
                                },
                                child: Text(
                                  "S'inscrire ?",
                                  style: TextStyle(
                                    color: CustomTheme.primaryColor,
                                    fontSize: CustomTheme.bodyText1.sp(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        /*Center(
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
        ),*/
      ),
    );
  }
}
