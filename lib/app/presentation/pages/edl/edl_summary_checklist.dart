import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/cubit/gauge_cubit.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlSummaryChecklistPage extends StatelessWidget {
  const EdlSummaryChecklistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocProvider(
        create: (context) => GaugeCubit(),
        child: ScaffoldBody(
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
                          TitleWithSeparator(title: "Départ".toUpperCase()),
                          const SizedBox(
                            height: 30,
                          ),
                          SecondaryButton(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Photos extérieures".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                    color: CustomTheme.primaryColor,
                                  ),
                                ),
                                Image.asset(
                                  "${assetsImages}success.png",
                                  width: 30.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Photos intérieures".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                    color: CustomTheme.primaryColor,
                                  ),
                                ),
                                Image.asset(
                                  "${assetsImages}success.png",
                                  width: 30.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Liste des défauts".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                    color: CustomTheme.primaryColor,
                                  ),
                                ),
                                Image.asset(
                                  "${assetsImages}success.png",
                                  width: 30.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "niveau de carburant".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                    color: CustomTheme.primaryColor,
                                  ),
                                ),
                                Image.asset(
                                  "${assetsImages}success.png",
                                  width: 30.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "kilométrage".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                    color: CustomTheme.primaryColor,
                                  ),
                                ),
                                Image.asset(
                                  "${assetsImages}success.png",
                                  width: 30.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SecondaryButton(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "signature".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                    color: CustomTheme.primaryColor,
                                  ),
                                ),
                                const Icon(
                                  Icons.radio_button_off,
                                  size: 30.0,
                                  color: CustomTheme.secondaryColor,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          PrimaryButton(
                            width: 40.w(context),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.signatureConfirm);
                            },
                            child: Text(
                              'Signer'.toUpperCase(),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
