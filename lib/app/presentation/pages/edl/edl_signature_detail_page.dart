import 'dart:typed_data';

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

class EdlSignatureDetailPage extends StatelessWidget {
  const EdlSignatureDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgByte =
        ModalRoute.of(context)!.settings.arguments as ValueNotifier<Uint8List?>;
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
                            height: CustomTheme.spacer,
                          ),
                          ContractDetailCard(
                            contract: edlBloc.contract.numberContrat,
                            intutile: edlBloc.contract.customer?.firstName,
                            vehicle: edlBloc.contract.vehicle?.mark,
                            typeLocation:
                                edlBloc.contract.rate?.rent?.first.locationType,
                            departureDate: edlBloc.contract.info?.departureDate,
                            returnDate: edlBloc.contract.info?.returnDate,
                          ),
                          CheckboxListTile(
                            activeColor: CustomTheme.primaryColor,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.all(0.0),
                            value: true,
                            onChanged: (v) {},
                            title: Text(
                              "Bon pour accord",
                              style: TextStyle(
                                fontSize: CustomTheme.subtitle2.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          ContainerRoundedGrey(
                            width: 300,
                            height: 100,
                            child: Image.memory(imgByte.value!),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          PrimaryButton(
                            width: 40.w(context),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.edlSignatureSuccess);
                            },
                            child: Text(
                              'Terminer',
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
