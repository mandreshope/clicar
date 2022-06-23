import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/statistique/bloc/stat_bloc.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/item_list_vehicle.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListVehicleStatPage extends StatelessWidget {
  const ListVehicleStatPage({Key? key}) : super(key: key);

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
            if (currState is GetListVehicleStatSuccessState) {
              return true;
            } else {
              return false;
            }
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
                        const TitleWithSeparator(title: "Liste des vehicules"),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        if (state is GetListVehicleLoadingState)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        else if (state is GetListVehicleStatSuccessState) ...[
                          TextField(
                            decoration: const InputDecoration(
                                label: Text("Rechercher")),
                            onChanged: (value) {
                              //Todo search vehicle
                            },
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          ...state.vehicles.map((e) {
                            return ItemListVehicle(statVehicle: e);
                          })
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
