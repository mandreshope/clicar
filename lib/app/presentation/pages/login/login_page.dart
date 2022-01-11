import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/responsive.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/app/core/utils/extension.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    debugPrint("==========> widget rebuild");
    return Scaffold(
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
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: CustomTheme.radius,
                    topRight: CustomTheme.radius,
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 05.h(context).sp(context),
                          horizontal: 10.w(context).sp(context),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const TitleWithSeparator(title: "Connexion"),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFieldFilled(
                                labelText: 'Utilisateur',
                                controller: username,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez saisir votre username';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              TextFieldFilled(
                                labelText: 'Mot de passe',
                                controller: password,
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez saisir votre mot de passe';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              BlocBuilder<AuthBloc, BaseState>(
                                buildWhen: (prevState, currState) {
                                  if (currState.status == Status.logged) {
                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((timeStamp) {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              AppRoutes.home, (route) => false);
                                    });
                                  } else if (currState.status == Status.error) {
                                    if (currState.message == "Unauthorized") {
                                      SnackBarWidget.show(
                                        isError: true,
                                        message:
                                            "Nom d'utilisateur ou mot de pase invalide",
                                        context: context,
                                      );
                                    } else {
                                      SnackBarWidget.show(
                                        isError: true,
                                        message: currState.message,
                                        context: context,
                                      );
                                    }
                                  }
                                  return currState.status != Status.logged;
                                },
                                builder: (context, state) {
                                  return Visibility(
                                    visible: state is LoginLoadingState,
                                    child: PrimaryButton(
                                      height: 50.0,
                                      width: 40.w(context),
                                      child: const CircularProgress(
                                        color: Colors.white,
                                      ),
                                    ),
                                    replacement: PrimaryButton(
                                      height: 50.0,
                                      width: 40.w(context),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          BlocProvider.of<AuthBloc>(context)
                                              .add(UserLoginEvent(
                                            username: username.text,
                                            password: password.text,
                                          ));
                                        }
                                      },
                                      child: Text(
                                        'Se connecter',
                                        style: TextStyle(
                                          fontSize:
                                              CustomTheme.button.sp(context),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.forgotPassword,
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
                              /*const SizedBox(
                                height: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.register,
                                  );
                                },
                                child: Text(
                                  "S'inscrire ?",
                                  style: TextStyle(
                                    color: CustomTheme.primaryColor,
                                    fontSize: CustomTheme.bodyText1.sp(context),
                                  ),
                                ),
                              ),*/
                            ],
                          ),
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
    );
  }
}
