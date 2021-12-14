import 'package:clicar/core/utils/extension.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/core/utils/validator.dart';
import 'package:clicar/presentation/pages/account/bloc/user_info/user_info_bloc.dart'
    as user_info_bloc;
import 'package:clicar/presentation/pages/home/bloc/user_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:clicar/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({Key? key}) : super(key: key);

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController role = TextEditingController();
  final TextEditingController deleted = TextEditingController();
  final TextEditingController id = TextEditingController();

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
            child: SizedBox(
              height: Responsive.height(context) -
                  (Responsive.height(context) * 0.75),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const Avatar(),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        state is MeState ? state.user.username.toString() : "-",
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
                        state is MeState ? state.user.email ?? "-" : "-",
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
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              if (state is MeState) {
                                username.text = state.user.username ?? '';
                                email.text = state.user.email ?? '';
                                lastName.text = state.user.lastName ?? '';
                                firstName.text = state.user.firstName ?? '';
                                role.text = state.user.role ?? '';
                                id.text = state.user.id ?? '';
                              }
                              return Column(
                                children: [
                                  const TitleWithSeparator(title: "Mes infos"),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFieldFilled(
                                          initialValue: lastName.text,
                                          labelText: 'Nom',
                                          controller: lastName,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Veuillez saisir votre nom';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: CustomTheme.spacer,
                                      ),
                                      Expanded(
                                        child: TextFieldFilled(
                                          initialValue: firstName.text,
                                          labelText: 'Prénom',
                                          controller: firstName,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Veuillez saisir votre prénom';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  TextFieldFilled(
                                    initialValue: username.text,
                                    labelText: "Nom d'utilisateur",
                                    controller: username,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez saisir votre nom d'utilisateur";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  TextFieldFilled(
                                    initialValue: email.text,
                                    labelText: 'Email',
                                    controller: email,
                                    validator: Validator.email,
                                  ),
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  TextFieldFilled(
                                    initialValue: role.text,
                                    labelText: 'Rôle',
                                    controller: role,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Veuillez saisir votre rôle';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  BlocBuilder<user_info_bloc.UserInfoBloc,
                                      user_info_bloc.UserInfoState>(
                                    buildWhen: (prevState, currState) {
                                      if (currState is user_info_bloc
                                          .UserInfoUpdatedState) {
                                        SnackBarWidget.show(
                                          isError: false,
                                          message:
                                              "Infos mis à jour avec succès",
                                          context: context,
                                        );
                                      } else if (currState
                                          is user_info_bloc.ErrorState) {
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
                                            is user_info_bloc.LoadingState,
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
                                              context
                                                  .read<
                                                      user_info_bloc
                                                          .UserInfoBloc>()
                                                  .add(user_info_bloc
                                                      .UserInfoUpdateEvent(
                                                    username: username.text,
                                                    email: email.text,
                                                    lastName: lastName.text,
                                                    firstName: firstName.text,
                                                    role: role.text,
                                                    deleted: false,
                                                    id: id.text,
                                                  ));
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
                              );
                            },
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
