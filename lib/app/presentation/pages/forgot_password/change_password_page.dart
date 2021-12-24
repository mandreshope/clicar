import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/responsive.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/core/utils/validator.dart';
import 'package:clicar/app/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/app/core/utils/extension.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController code = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      (Responsive.height(context) * .6),
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
            initialChildSize: 0.6,
            minChildSize: 0.6,
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
                              const TitleWithSeparator(
                                  title: "Mot de passe oublié ?"),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFieldFilled(
                                controller: code,
                                labelText: "Code de confirmation",
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez saisir le code';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              TextFieldFilled(
                                controller: email,
                                labelText: "Email",
                                textInputType: TextInputType.emailAddress,
                                validator: Validator.email,
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              TextFieldFilled(
                                controller: password,
                                labelText: 'Nouveau mot de passe',
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Veuillez saisir votre nouveau mot de passe';
                                  } else if (value.isValidatePassword() ==
                                      false) {
                                    return 'Veuillez saisir au moin 6 caractères';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              BlocBuilder<ForgotPasswordBloc,
                                  ForgotPasswordState>(
                                buildWhen: (prevState, currState) {
                                  if (currState is PasswordChangedState) {
                                    SnackBarWidget.show(
                                      isError: false,
                                      message:
                                          "Votre mot de passe a été modifié avec succès",
                                      context: context,
                                    );
                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((timeStamp) {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              AppRoutes.login,
                                              (route) => false);
                                    });
                                  } else if (currState is ErrorState) {
                                    if (currState.message == "Locked") {
                                      SnackBarWidget.show(
                                        isError: true,
                                        message:
                                            "Code de confirmation invalide",
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
                                  return true;
                                },
                                builder: (context, state) {
                                  return Visibility(
                                    visible: state is LoadingState,
                                    child: PrimaryButton(
                                      height: 50.0,
                                      width: 40.w(context),
                                      child: const CircularProgress(
                                        color: Colors.white,
                                      ),
                                    ),
                                    replacement: PrimaryButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<ForgotPasswordBloc>()
                                              .add(ChangePasswordEvent(
                                                password: password.text,
                                                code: code.text,
                                                email: email.text,
                                              ));
                                        }
                                      },
                                      height: 50.0,
                                      width: 40.w(context),
                                      child: Text(
                                        'Valider',
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
