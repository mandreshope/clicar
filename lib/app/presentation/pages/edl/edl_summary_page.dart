import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_card.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlSummaryPage extends StatelessWidget {
  const EdlSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Stack(
        children: [
          BlocBuilder<EdlBloc, BaseState>(
            buildWhen: (prevState, currState) {
              return prevState != currState;
            },
            builder: (context, state) {
              final departureBloc = context.read<EdlBloc>();
              return DraggableScrollableSheet(
                initialChildSize: 1.0,
                minChildSize: 1.0,
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
                            child: Column(
                              children: [
                                const TitleWithSeparator(title: "Signature"),
                                const SizedBox(
                                  height: 30,
                                ),
                                SecondaryButton(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      departureBloc.contract.numberContrat ??
                                          "-",
                                      style: TextStyle(
                                        fontSize: CustomTheme
                                            .mainBtnTextStyle.fontSize
                                            ?.sp(context),
                                        color: CustomTheme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: CustomTheme.spacer,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Récapitulatif",
                                    style: TextStyle(
                                      fontSize:
                                          CustomTheme.subtitle2.sp(context),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const Divider(),
                                ContractDetailCard(
                                  contract:
                                      departureBloc.contract.numberContrat,
                                  intutile:
                                      departureBloc.contract.driver?.address,
                                  vehicle: departureBloc.contract.vehicle?.mark,
                                  typeLocation: departureBloc
                                      .contract.rate?.rent?.first.locationType,
                                  departureDate: departureBloc
                                      .contract.info?.departureDate,
                                  returnDate:
                                      departureBloc.contract.info?.returnDate,
                                ),
                                const SizedBox(
                                  height: CustomTheme.spacer,
                                ),
                                const SizedBox(
                                  height: CustomTheme.spacer,
                                ),
                                PrimaryButton(
                                  width: 40.w(context),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.edlPhotoPicker);
                                  },
                                  child: Text(
                                    'état des lieux'.toUpperCase(),
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
                    ),
                  );
                },
              );
            },
          ),
          //footer
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: BottomLogo(),
          )
        ],
      ),
    );
  }
}
