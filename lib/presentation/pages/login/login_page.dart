import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/blocs/login/login_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            ),
            Positioned(
              top: Responsive.height(context) * .2,
              left: 0,
              right: 0,
              child: Image.asset(
                "${assetsImages}clicar_logo.png",
                scale: 5,
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
                            vertical: Responsive.height(context) * .05,
                            horizontal: Responsive.width(context) * .10,
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
                                width: Responsive.width(context) * .3,
                                child: Text(
                                  'Se connecter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Mot de passe oublié ?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: CustomTheme.primaryColor,
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
