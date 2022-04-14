import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/widgets/search_bdc_result.dart';
import 'package:clicar/app/presentation/widgets/search_contract_result.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/search_reservation_result.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignaturePage extends StatelessWidget {
  SignaturePage({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();
  final ExpandableController expandableController = ExpandableController();
  @override
  Widget build(BuildContext context) {
    SignatureAssociate signatureAssociate =
        navigatorArgs(context) as SignatureAssociate;
    String typeText = "";
    switch (signatureAssociate) {
      case SignatureAssociate.contract:
        typeText = "Contrats";
        break;
      case SignatureAssociate.reservation:
        typeText = "Réservations";
        break;
      default:
        typeText = "Bon de commande";
        break;
    }
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
          child: BlocBuilder<SignatureBloc, BaseState>(
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
                                            '$typeText à signer'.toUpperCase(),
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
                                              if (v.trim().isEmpty) {
                                                return;
                                              }
                                              context.read<SignatureBloc>().add(
                                                  SearchContractEvent(
                                                      keyWord: search.text,
                                                      signatureAssociate:
                                                          signatureAssociate));
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
                                              is SearchContractState && signatureAssociate == SignatureAssociate.contract) ...[
                                            if (state.contracts.isEmpty)
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Aucun contrat trouvé"),
                                              )
                                            else
                                              ...state.contracts
                                                  .map(
                                                    (contract) =>
                                                        SearchContractResult(
                                                      onTap: () {
                                                        search.clear();
                                                        expandableController
                                                            .toggle();
                                                        final signatureBloc =
                                                            context.read<
                                                                SignatureBloc>();
                                                        signatureBloc.contract =
                                                            contract;
                                                        signatureBloc.add(
                                                            SelectContractEvent(
                                                          contract: contract,
                                                        ));

                                                        Navigator.of(context).pushNamed(
                                                            AppRoutes
                                                                .signatureSummary,
                                                            arguments:
                                                                signatureAssociate);
                                                      },
                                                      contract: contract,
                                                    ),
                                                  )
                                                  .toList(),
                                          ] else if (state
                                              is SearchReservationState && signatureAssociate == SignatureAssociate.reservation) ...[
                                            if (state.reservations.isEmpty)
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Aucun contrat trouvé"),
                                              )
                                            else
                                              ...state.reservations
                                                  .map((reservation) =>
                                                      SearchReservationResult(
                                                          onTap: () {
                                                            search.clear();
                                                            expandableController
                                                                .toggle();
                                                            final signatureBloc =
                                                                context.read<
                                                                    SignatureBloc>();
                                                            signatureBloc
                                                                    .reservation =
                                                                reservation;
                                                            signatureBloc.add(
                                                                SelectReservationEvent(
                                                              reservation:
                                                                  reservation,
                                                            ));

                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    AppRoutes
                                                                        .signatureSummary,
                                                                    arguments:
                                                                        signatureAssociate);
                                                          },
                                                          reservation:
                                                              reservation))
                                                  .toList(),
                                          ] else if (state
                                              is SearchBdcState && signatureAssociate == SignatureAssociate.bdc) ...[
                                            if (state.bdcs.isEmpty)
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                    "Aucun contrat trouvé"),
                                              )
                                            else
                                              ...state.bdcs
                                                  .map((bdc) =>
                                                      SearchBdcResult(
                                                          onTap: () {
                                                            search.clear();
                                                            expandableController
                                                                .toggle();
                                                            final signatureBloc =
                                                                context.read<
                                                                    SignatureBloc>();
                                                            signatureBloc
                                                                    .bdc =
                                                                bdc;
                                                            signatureBloc.add(
                                                                SelectBdcEvent(
                                                              bdc:
                                                                  bdc,
                                                            ));

                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    AppRoutes
                                                                        .signatureSummary,
                                                                    arguments:
                                                                        signatureAssociate);
                                                          },
                                                          bdc:
                                                              bdc))
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
