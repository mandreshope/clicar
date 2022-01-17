import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/widgets/search_contract_result.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlDeparturePage extends StatefulWidget {
  const EdlDeparturePage({Key? key}) : super(key: key);

  @override
  State<EdlDeparturePage> createState() => _EdlDeparturePageState();
}

class _EdlDeparturePageState extends State<EdlDeparturePage> {
  final TextEditingController search = TextEditingController();

  final ExpandableController expandableController = ExpandableController();

  @override
  void initState() {
    super.initState();
    final edlBloc = context.read<EdlBloc>();
    edlBloc.typeEdl = TypeEdl.departure;
  }

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
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
        body: ScaffoldBody(
          child: BlocBuilder<EdlBloc, BaseState>(
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
                          ExpandableNotifier(
                            controller: expandableController,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                color: CustomTheme.greyColor,
                              ),
                              child: Column(
                                children: <Widget>[
                                  ScrollOnExpand(
                                    scrollOnExpand: true,
                                    scrollOnCollapse: false,
                                    child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToCollapse: true,
                                      ),
                                      header: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Text(
                                            'Etats des lieux en attente'
                                                .toUpperCase(),
                                            style: CustomTheme.mainBtnTextStyle
                                                .copyWith(
                                              color: CustomTheme.primaryColor,
                                              fontSize: CustomTheme
                                                  .mainBtnTextStyle.fontSize
                                                  ?.sp(context),
                                            ),
                                          )),
                                      collapsed: const SizedBox.shrink(),
                                      expanded: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SearchTextFieldUnderlined(
                                            controller: search,
                                            onChanged: (v) {
                                              context.read<EdlBloc>().add(
                                                  SearchContractEvent(
                                                      keyWord: search.text));
                                            },
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          if (state.status ==
                                              Status.loading) ...[
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CircularProgress(),
                                            ),
                                          ] else if (state
                                              is SearchContractState) ...[
                                            if (state.contracts.isEmpty)
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Aucun contrat trouvé"),
                                              )
                                            else
                                              ...state.contracts
                                                  .map((contract) =>
                                                      SearchContractResult(
                                                          onTap: () {
                                                            search.clear();
                                                            expandableController
                                                                .toggle();

                                                            edlBloc.contract =
                                                                contract;
                                                            edlBloc.add(
                                                                SelectContractEvent(
                                                              contract:
                                                                  contract,
                                                            ));

                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                              AppRoutes
                                                                  .edlSummary,
                                                            );
                                                          },
                                                          contract: contract))
                                                  .toList(),
                                          ]
                                        ],
                                      ),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
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
