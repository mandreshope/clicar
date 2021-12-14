import 'package:clicar/core/routes/app_pages.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/core/utils/validator.dart';
import 'package:clicar/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:clicar/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/core/utils/extension.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
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
                      (Responsive.height(context) * .5),
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
                              const TitleWithSeparator(
                                  title: "Mot de passe oublié ?"),
                              const SizedBox(
                                height: 30,
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
                              BlocBuilder<ForgotPasswordBloc,
                                  ForgotPasswordState>(
                                buildWhen: (prevState, currState) {
                                  if (currState is VerificationCodeSentState) {
                                    SnackBarWidget.show(
                                      isError: false,
                                      message:
                                          "un code est envoyé à votre adresse email",
                                      context: context,
                                    );
                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((timeStamp) {
                                      Navigator.of(context).pushNamed(
                                        Routes.changePassword,
                                      );
                                    });
                                  } else if (currState is ErrorState) {
                                    if (currState.message == "Bad Request") {
                                      SnackBarWidget.show(
                                        isError: true,
                                        message:
                                            "Veuillez vérifier votre email",
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
                                              .add(UserForgotPasswordEvent(
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
