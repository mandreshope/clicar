import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/responsive.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/core/utils/validator.dart';
import 'package:clicar/app/presentation/pages/account/bloc/account/account_bloc.dart';
import 'package:clicar/app/presentation/pages/account/bloc/user_info/user_info_bloc.dart'
    as user_info_bloc;
import 'package:clicar/app/presentation/pages/account/bloc/user_info/user_info_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPasswordPage extends StatelessWidget {
  UserPasswordPage({Key? key}) : super(key: key);

  final TextEditingController password = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController cpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, BaseState>(
            listener: (context, state) {
              if (state.status == Status.tokenExpired) {
                SnackBarWidget.show(
                  isError: true,
                  message: tokenExpiredMessage,
                  context: context,
                );
                context.read<AuthBloc>().add(UserLogOutEvent());
              } else if (state.status == Status.error) {
                SnackBarWidget.show(
                  isError: true,
                  message: state.message,
                  context: context,
                );
              }
            },
          ),
          BlocListener<UserInfoBloc, BaseState>(
            listener: (context, state) {
              if (state.status == Status.tokenExpired) {
                SnackBarWidget.show(
                  isError: true,
                  message: tokenExpiredMessage,
                  context: context,
                );
                context.read<AuthBloc>().add(UserLogOutEvent());
              }
            },
          ),
        ],
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
                child: SizedBox(
                  height: Responsive.height(context) -
                      (Responsive.height(context) * 0.75),
                  child: BlocBuilder<UserBloc, BaseState>(
                    buildWhen: (prevState, currState) {
                      return currState is MeUserState;
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Avatar(
                            url: state is MeUserState ? state.user.photo : null,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            state is MeUserState
                                ? state.user.username.toString()
                                : "-",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: CustomTheme.subtitle1.sp(context),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state is MeUserState
                                ? state.user.email ?? "-"
                                : "-",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: CustomTheme.subtitle1.sp(context),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.75,
                minChildSize: 0.75,
                maxChildSize: 1.0,
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
                                      title: "Mot de passe"),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextFieldFilled(
                                    controller: password,
                                    labelText: 'Ancien mot de passe',
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Veuillez saisir votre ancien mot de passe';
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
                                    controller: newPassword,
                                    labelText: 'Nouveau mot de passe',
                                    textInputType:
                                        TextInputType.visiblePassword,
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
                                  TextFieldFilled(
                                    controller: cpassword,
                                    labelText: 'Nouveau mot de passe confirmer',
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Veuillez saisir votre confirmation nouveau mot de passe';
                                      } else if (value != newPassword.text) {
                                        return 'les mots de passe saisis ne correspondent pas';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  BlocBuilder<AccountBloc, BaseState>(
                                    buildWhen: (prevState, currState) {
                                      if (currState
                                          is UserChangePasswordSuccessState) {
                                        SnackBarWidget.show(
                                          isError: false,
                                          message:
                                              "Mot de passe à jour avec succès",
                                          context: context,
                                        );
                                        context
                                            .read<UserBloc>()
                                            .add(MeUserEvent());
                                      } else if (currState.status ==
                                          Status.tokenExpired) {
                                        SnackBarWidget.show(
                                          isError: true,
                                          message: tokenExpiredMessage,
                                          context: context,
                                        );

                                        context
                                            .read<AuthBloc>()
                                            .add(UserLogOutEvent());
                                      } else if (currState.status ==
                                          Status.error) {
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
                                        visible: state
                                            is UserChangePasswordLoadinState,
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
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final id = context
                                                  .read<UserBloc>()
                                                  .currentUser
                                                  ?.id;
                                              if (id == null) {
                                                return;
                                              }
                                              context.read<AccountBloc>().add(
                                                    UserChangePasswordEvent(
                                                      password: password.text,
                                                      newPassword:
                                                          newPassword.text,
                                                      id: id,
                                                    ),
                                                  );
                                            }
                                          },
                                          child: Text(
                                            'Valider',
                                            style: TextStyle(
                                              fontSize: CustomTheme.button
                                                  .sp(context),
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
      ),
    );
  }
}
