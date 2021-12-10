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

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
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
                        (Responsive.height(context) * 0.7),
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
              initialChildSize: 0.7,
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
                              const TitleWithSeparator(title: "Inscription"),
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
                                labelText: 'Nom',
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              const TextFieldFilled(
                                labelText: 'Prénom',
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              const TextFieldFilled(
                                labelText: 'Email',
                                textInputType: TextInputType.emailAddress,
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
                              const TextFieldFilled(
                                labelText: 'Confirmation mot de passe',
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
                                  );
                                },
                                width: Responsive.width(context) * .3,
                                child: Text(
                                  "S'inscrire",
                                  style: TextStyle(
                                    fontSize: CustomTheme.button.sp(context),
                                    color: Colors.white,
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
      ),
    );
  }
}
