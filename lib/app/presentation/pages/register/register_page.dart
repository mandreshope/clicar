import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/responsive.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/core/utils/validator.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/app/core/utils/extension.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController role = TextEditingController();

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
            minChildSize: 0.7,
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
                              const TitleWithSeparator(title: "Inscription"),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFieldFilled(
                                controller: username,
                                labelText: "Nom d'utilisateur",
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
                                controller: lastName,
                                labelText: 'Nom',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez saisir votre nom';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              TextFieldFilled(
                                controller: firstName,
                                labelText: 'Prénom',
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez saisir votre prénom';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              TextFieldFilled(
                                controller: email,
                                labelText: 'Email',
                                textInputType: TextInputType.emailAddress,
                                validator: Validator.email,
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              TextFieldFilled(
                                controller: password,
                                labelText: 'Mot de passe',
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Veuillez saisir votre mot de passe';
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
                              TextFieldFilled(
                                controller: cpassword,
                                labelText: 'Confirmation mot de passe',
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null) {
                                    return 'Veuillez saisir votre confirmation mot de passe';
                                  } else if (value != password.text) {
                                    return 'les mots de passe saisis ne correspondent pas';
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
                                    SnackBarWidget.show(
                                      isError: true,
                                      message: currState.message,
                                      context: context,
                                    );
                                  }
                                  return true;
                                },
                                builder: (context, state) {
                                  return Visibility(
                                    visible: state.status == Status.loading,
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
                                              .read<AuthBloc>()
                                              .add(UserRegisterEvent(
                                                username: username.text,
                                                email: email.text,
                                                password: password.text,
                                                lastName: lastName.text,
                                                firstName: firstName.text,
                                                role: role.text,
                                              ));
                                        }
                                      },
                                      height: 50.0,
                                      width: 40.w(context),
                                      child: Text(
                                        "S'inscrire",
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
