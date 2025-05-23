import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/statistique/bloc/stat_bloc.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/item_stat_card.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/option_filter_card.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlottePage extends StatelessWidget {
  const FlottePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: ScaffoldBody(
          child: BlocBuilder<StatBloc, BaseState>(
              buildWhen: (prevState, currState) {
            return prevState != currState;
          }, builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 05.h(context).sp(context),
                      horizontal: 5.w(context).sp(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        const TitleWithSeparator(title: "Gestion de flotte"),
                        OptionFilterCard(
                          filterWithDay: (Map<String, dynamic> data) {
                            context
                                .read<StatBloc>()
                                .add(GetStatFlotteEvent(data: data));
                          },
                        ),
                        if (state.status == Status.loading)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        else if (state is GetStatFlotteSuccessState)
                          Card(
                            child: Column(
                              children: [
                                ItemStatCard(
                                  trailing: Text(
                                      "${state.gestionFlotteStat.vehiclDispo}-${state.gestionFlotteStat.inDispo}%"),
                                  color: Colors.blue,
                                  info: "Véhicule disponible",
                                ),
                                ItemStatCard(
                                  trailing: Text(
                                      "${state.gestionFlotteStat.nbPourcLoue}-${state.gestionFlotteStat.pourcentageLoue}%"),
                                  color: const Color(0xFFb8dfff),
                                  info: "Véhicule loués",
                                ),
                                ItemStatCard(
                                  trailing: Text(
                                      "${state.gestionFlotteStat.pourcentageRendu}-${state.gestionFlotteStat.nbRendu}%"),
                                  color: const Color(0xFFb8dfff),
                                  info: "Véhicule rendu",
                                ),
                                ItemStatCard(
                                  trailing: Text(
                                      "${state.gestionFlotteStat.pourcentageBooking}-${state.gestionFlotteStat.nbvehicleBooking}%"),
                                  color: const Color(0xFFb8dfff),
                                  info: "Véhicule réservé",
                                ),
                                ItemStatCard(
                                  trailing: Text(
                                      "${state.gestionFlotteStat.totalVehicl}"),
                                  color: const Color(0xFFb8dfff),
                                  info: "Total véhicule",
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
