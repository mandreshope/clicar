import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/widgets/contract_detail_card.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signature_bloc.dart';

class SignatureConfimPage extends StatelessWidget {
  const SignatureConfimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: ScaffoldBody(
          child: BlocBuilder<SignatureBloc, BaseState>(
            buildWhen: (prevState, currState) {
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
                            width: double.infinity,
                            child: Text(
                              "signature".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          ContractDetailCard(
                            contract: context
                                .read<SignatureBloc>()
                                .contract
                                .numberContrat,
                            intutile: context
                                .read<SignatureBloc>()
                                .contract
                                .driver
                                ?.address,
                            vehicle: context
                                .read<SignatureBloc>()
                                .contract
                                .vehicle
                                ?.mark,
                            typeLocation: context
                                .read<SignatureBloc>()
                                .contract
                                .rate
                                ?.rent
                                ?.first
                                .locationType,
                            departureDate: context
                                .read<SignatureBloc>()
                                .contract
                                .info
                                ?.departureDate,
                            returnDate: context
                                .read<SignatureBloc>()
                                .contract
                                .info
                                ?.returnDate,
                          ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          SecondaryButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.signatureDraw);
                            },
                            height: 100,
                            width: double.infinity,
                            child: Text(
                              "cliquer ici pour signer".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: Colors.grey,
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
