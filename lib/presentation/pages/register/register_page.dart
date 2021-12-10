import 'package:clicar/core/routes/app_pages.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/pages/register/bloc/register_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:clicar/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/core/utils/extension.dart';

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
    return BlocProvider<RegisterBloc>(
      create: (_) => sl<RegisterBloc>(),
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
                                  controller: lastName,
                                  labelText: 'Nom',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
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
                                    if (value == null || value.isEmpty) {
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
                                  validator: (value) {
                                    if (value?.isValidateEmail == false) {
                                      return 'Veuillez saisir email valide';
                                    }
                                    return null;
                                  },
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
                                    if (value?.isValidatePassword() == false) {
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
                                    if (value != password.text) {
                                      return 'les mots de passe saisis ne correspondent pas';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: CustomTheme.spacer,
                                ),
                                BlocBuilder<RegisterBloc, RegisterState>(
                                  builder: (context, state) {
                                    if (state is LoadingState) {
                                      return PrimaryButton(
                                        height: 50.0,
                                        width: 40.w(context),
                                        child: const CircularProgress(
                                          color: Colors.white,
                                        ),
                                      );
                                    } else if (state is RegisteredState) {
                                      WidgetsBinding.instance!
                                          .addPostFrameCallback((timeStamp) {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                Routes.login, (route) => false);
                                      });
                                    } else if (state is ErrorState) {
                                      SnackBarWidget.show(
                                        message: state.message,
                                        context: context,
                                      );
                                    }

                                    return PrimaryButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<RegisterBloc>()
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
      ),
    );
  }
}
