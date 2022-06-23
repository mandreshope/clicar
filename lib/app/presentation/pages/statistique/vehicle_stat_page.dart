import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/statistique/bloc/stat_bloc.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/option_filter_card.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleStatPage extends StatelessWidget {
  const VehicleStatPage({Key? key}) : super(key: key);

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
                        const TitleWithSeparator(title: "vehicule"),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        OptionFilterCard(
                          filterWithDay: (Map<String, dynamic> data) {
                            // data["idVehicle"] = e.id;
                            context
                                .read<StatBloc>()
                                .add(GetStatFlotteEvent(data: data));
                          },
                        ),
                        if (state.status == Status.loading)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        else if (state is GetVehicleStatSuccessState) ...[
                          Row(
                            children: [
                              Text(
                                "Mise en service: ",
                                style: TextStyle(
                                    color: const Color(0xFF8f94b2),
                                    fontSize: CustomTheme.headline1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateTime.now().toString().split(' ')[0],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Durée moyenne",
                                      style: TextStyle(
                                          color: const Color(0xFF8f94b2),
                                          fontSize: CustomTheme.headline1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${state.statVehicle.jour} Jour",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: CustomTheme.headline3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Taux d'occupation",
                                      style: TextStyle(
                                          color: const Color(0xFF8f94b2),
                                          fontSize: CustomTheme.headline1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${state.statVehicle.pourentage} %",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: CustomTheme.headline3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total CA",
                                      style: TextStyle(
                                          color: const Color(0xFF8f94b2),
                                          fontSize: CustomTheme.headline1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${state.statVehicle.chiffreAffaire} €",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: CustomTheme.headline3,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
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
