import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/accept_contract/accept_contract_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignatureSuccessPage extends StatelessWidget {
  const SignatureSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: ScaffoldBody(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 05.h(context).sp(context),
                    horizontal: 10.w(context).sp(context),
                  ),
                  child: BlocBuilder<SignatureBloc, BaseState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const TitleWithSeparator(title: "Signature"),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          const SuccessIcon(
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          Text(
                            context
                                    .read<SignatureBloc>()
                                    .contract
                                    .numberContrat ??
                                "-",
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                          ),
                          Text(
                            context
                                    .read<SignatureBloc>()
                                    .contract
                                    .driver
                                    ?.address ??
                                "-",
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                          ),
                          Text(
                            context
                                    .read<SignatureBloc>()
                                    .contract
                                    .vehicle
                                    ?.immat1 ??
                                "-",
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          Text(
                            'Signé le ${DateTime.now().formatDateyMd}',
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          BlocBuilder<AcceptContractBloc, BaseState>(
                            builder: (context, state) {
                              return PrimaryButton(
                                width: 40.w(context),
                                onPressed: () async {
                                  final bool? confirm = await showDialog<bool?>(
                                    context: context,
                                    barrierDismissible: false,
                                    barrierColor: Colors.transparent,
                                    builder: (BuildContext context) =>
                                        const ConfirmDialog(
                                            title:
                                                "Voulez-vous continuer avec l'EDL ?"),
                                  );
                                  context.read<AcceptContractBloc>().add(
                                      const AcceptContractEvent(
                                          isAccepted: false));
                                  if (confirm == true) {
                                    ///TODO: go to EDL départ
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            AppRoutes.home, (route) => false);
                                  } else {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            AppRoutes.home, (route) => false);
                                  }
                                },
                                child: Text(
                                  'Terminer',
                                  style: TextStyle(
                                    fontSize: CustomTheme.button.sp(context),
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
