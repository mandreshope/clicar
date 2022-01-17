import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_card.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlSignatureConfimPage extends StatelessWidget {
  const EdlSignatureConfimPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: ScaffoldBody(
          child: BlocBuilder<EdlBloc, BaseState>(
            buildWhen: (prevState, currState) {
              return prevState != currState;
            },
            builder: (context, state) {
              final edlBloc = context.read<EdlBloc>();
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
                          TitleWithSeparator(
                            title: edlBloc.typeEdl == TypeEdl.departure
                                ? "Départ".toUpperCase()
                                : "Retour".toUpperCase(),
                          ),
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
                            contract: edlBloc.contract.numberContrat,
                            intutile: edlBloc.contract.driver?.address,
                            vehicle: edlBloc.contract.vehicle?.mark,
                            typeLocation:
                                edlBloc.contract.rate?.rent?.first.locationType,
                            departureDate: edlBloc.contract.info?.departureDate,
                            returnDate: edlBloc.contract.info?.returnDate,
                          ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          SecondaryButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.edlSignatureDraw);
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
