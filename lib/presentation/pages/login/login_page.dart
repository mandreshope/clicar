import 'package:clicar/core/routes/app_pages.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/pages/login/bloc/login_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:clicar/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/core/utils/extension.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                                    if (value == null || value.isEmpty) {
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
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    if (state is LoadingState) {
                                      return PrimaryButton(
                                        height: 50.0,
                                        width: 40.w(context),
                                        child: const CircularProgress(
                                          color: Colors.white,
                                        ),
                                      );
                                    } else if (state is LoggedState) {
                                      WidgetsBinding.instance!
                                          .addPostFrameCallback((timeStamp) {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                Routes.home, (route) => false);
                                      });
                                    } else if (state is ErrorState) {
                                      SnackBarWidget.show(
                                        message: state.message,
                                        context: context,
                                      );
                                    }
                                    return PrimaryButton(
                                      height: 50.0,
                                      width: 40.w(context),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<LoginBloc>()
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
                                    );
                                  },
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
                                      fontSize:
                                          CustomTheme.bodyText1.sp(context),
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
                                      fontSize:
                                          CustomTheme.bodyText1.sp(context),
                                    ),
                                  ),
                                ),
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
      ),
    );
  }
}
