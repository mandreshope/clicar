import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/accept_contract/accept_contract_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlSignatureSuccessPage extends StatelessWidget {
  const EdlSignatureSuccessPage({Key? key}) : super(key: key);

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
                  child: BlocBuilder<EdlBloc, BaseState>(
                    builder: (context, state) {
                      final edlBloc = context.read<EdlBloc>();
                      return Column(
                        children: [
                          TitleWithSeparator(
                            title: edlBloc.typeEdl == TypeEdl.departure
                                ? "Départ".toUpperCase()
                                : "Retour".toUpperCase(),
                          ),
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
                            edlBloc.contract.numberContrat ?? "-",
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                          ),
                          Text(
                            edlBloc.contract.driver?.address ?? "-",
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                          ),
                          Text(
                            edlBloc.contract.vehicle?.immat1 ?? "-",
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
                              final acceptContractBloc =
                                  context.read<AcceptContractBloc>();
                              return PrimaryButton(
                                width: 40.w(context),
                                onPressed: () async {
                                  edlBloc.resetAll();
                                  acceptContractBloc.add(
                                      const AcceptContractEvent(
                                          isAccepted: false));
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.home, (route) => false);
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
