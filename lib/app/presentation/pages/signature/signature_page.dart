import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/widgets/search_contract_result.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignaturePage extends StatelessWidget {
  SignaturePage({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();
  bool refresh = true;
  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
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
        body: Stack(
          children: [
            BlocBuilder<SignatureBloc, BaseState>(
              buildWhen: (prevState, currState) {
                return prevState != currState;
              },
              builder: (context, state) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 1.0,
                  minChildSize: 1.0,
                  maxChildSize: 1.0,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: CustomTheme.radius,
                          topRight: CustomTheme.radius,
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
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
                                  ExpandableNotifier(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5),
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
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Text(
                                                    'Contrats à signer'
                                                        .toUpperCase(),
                                                    style: CustomTheme
                                                        .mainBtnTextStyle
                                                        .copyWith(
                                                      color: CustomTheme
                                                          .primaryColor,
                                                      fontSize: CustomTheme
                                                          .mainBtnTextStyle
                                                          .fontSize
                                                          ?.sp(context),
                                                    ),
                                                  )),
                                              collapsed:
                                                  const SizedBox.shrink(),
                                              expanded: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SearchTextFieldUnderlined(
                                                    controller: search,
                                                    onChanged: (v) {
                                                      context
                                                          .read<SignatureBloc>()
                                                          .add(
                                                              SearchContractEvent(
                                                                  keyWord: v));
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  if (state.status ==
                                                      Status.loading) ...[
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: CircularProgress(),
                                                    ),
                                                  ] else if (state
                                                      is SearchContractState) ...[
                                                    if (state.contracts.isEmpty)
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                            "Aucun contrat trouvé"),
                                                      )
                                                    else
                                                      ...state.contracts
                                                          .map((contract) =>
                                                              SearchContractResult(
                                                                  contract:
                                                                      contract))
                                                          .toList(),
                                                  ]
                                                ],
                                              ),
                                              builder:
                                                  (_, collapsed, expanded) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  child: Expandable(
                                                    collapsed: collapsed,
                                                    expanded: expanded,
                                                    theme:
                                                        const ExpandableThemeData(
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
      ),
    );
  }
}
