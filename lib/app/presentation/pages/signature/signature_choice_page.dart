import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignatureChoicePage extends StatelessWidget {
  const SignatureChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: const [
            /*IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.account);
              },
              icon: const Icon(
                Icons.settings,
              ),
            )*/
          ],
        ),
        body: ScaffoldBody(
          child: BlocBuilder<SignatureBloc, BaseState>(
            buildWhen: (prevState, currState) {
              if (currState.status == Status.error) {
                SnackBarWidget.show(
                    context: context,
                    message: currState.message,
                    isError: true);
              }
              return prevState != currState;
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 05.h(context).sp(context),
                        horizontal: 10.w(context).sp(context),
                      ),
                      child: Column(
                        children: [
                          const TitleWithSeparator(title: "Signature"),
                          const SizedBox(
                            height: 30,
                          ),
                          SecondaryButton(
                            onPressed: () {
                              context.read<SignatureBloc>().signatureAssociate =
                                  SignatureAssociate.contract;
                              Navigator.of(context).pushNamed(
                                  AppRoutes.signature,
                                  arguments: SignatureAssociate.contract);
                            },
                            width: double.infinity,
                            child: Text(
                              "Signature des contrats".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            onPressed: () {
                              context.read<SignatureBloc>().signatureAssociate =
                                  SignatureAssociate.reservation;
                              Navigator.of(context).pushNamed(
                                  AppRoutes.signature,
                                  arguments: SignatureAssociate.reservation);
                            },
                            width: double.infinity,
                            child: Text(
                              "Signature des réservations".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            onPressed: () {
                              context.read<SignatureBloc>().signatureAssociate =
                                  SignatureAssociate.bdc;

                              Navigator.of(context).pushNamed(
                                  AppRoutes.signature,
                                  arguments: SignatureAssociate.bdc);
                            },
                            width: double.infinity,
                            child: Text(
                              "Signature des BDC".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
