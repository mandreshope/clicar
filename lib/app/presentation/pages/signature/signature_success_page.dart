import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/accept_contract/accept_contract_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/bdc_detail_card.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_card.dart';
import 'package:clicar/app/presentation/widgets/reservation_detail_card.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignatureSuccessPage extends StatelessWidget {
  const SignatureSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: ScaffoldBody(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 05.h(context).sp(context),
                    horizontal: 10.w(context).sp(context),
                  ),
                  child: BlocBuilder<SignatureBloc, BaseState>(
                    builder: (context, state) {
                      final signatureBloc = context.read<SignatureBloc>();
                      return Column(
                        children: [
                          const TitleWithSeparator(title: "Signature"),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          const SuccessIcon(
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          if (signatureBloc.signatureAssociate ==
                              SignatureAssociate.contract) ...[
                            ContractDetailCard(
                              contract: context
                                  .read<SignatureBloc>()
                                  .contract
                                  .numberContrat,
                              intutile: context
                                  .read<SignatureBloc>()
                                  .contract
                                  .customer
                                  ?.firstName,
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
                          ] else if (signatureBloc.signatureAssociate ==
                              SignatureAssociate.reservation) ...[
                            ReservationtDetailCard(
                              reservation: context
                                  .read<SignatureBloc>()
                                  .reservation
                                  .numberReservation,
                              vehicle: context
                                  .read<SignatureBloc>()
                                  .reservation
                                  .vehicule
                                  ?.mark,
                              typeLocation: context
                                  .read<SignatureBloc>()
                                  .reservation
                                  .rate
                                  ?.rent
                                  ?.first
                                  .locationType,
                              departureDate: context
                                  .read<SignatureBloc>()
                                  .reservation
                                  .info
                                  ?.departureDate,
                              returnDate: context
                                  .read<SignatureBloc>()
                                  .reservation
                                  .info
                                  ?.returnDate,
                            )
                          ] else if (signatureBloc.signatureAssociate ==
                              SignatureAssociate.bdc) ...[
                            BdcDetailCard(
                              bdc: context
                                  .read<SignatureBloc>()
                                  .bdc
                                  .numberContrat,
                              typeLocation: context
                                  .read<SignatureBloc>()
                                  .bdc
                                  .rate
                                  ?.rent
                                  ?.first
                                  .locationType,
                              departureDate: context
                                  .read<SignatureBloc>()
                                  .bdc
                                  .info
                                  ?.departureDate,
                              returnDate: context
                                  .read<SignatureBloc>()
                                  .bdc
                                  .info
                                  ?.returnDate,
                              vehicle: context
                                  .read<SignatureBloc>()
                                  .bdc
                                  .vehicleBooking
                                  ?.markAndType,
                            )
                          ],
                          // Text(
                          //   signatureBloc.contract.numberContrat ?? "-",
                          //   style: TextStyle(
                          //     color: CustomTheme.primaryColor,
                          //     fontSize: CustomTheme.headline1.sp(context),
                          //   ),
                          // ),
                          // Text(
                          //   signatureBloc.contract.driver?.address ?? "-",
                          //   style: TextStyle(
                          //     color: CustomTheme.primaryColor,
                          //     fontSize: CustomTheme.headline1.sp(context),
                          //   ),
                          // ),
                          // Text(
                          //   signatureBloc.contract.vehicle?.immat1 ?? "-",
                          //   style: TextStyle(
                          //     color: CustomTheme.primaryColor,
                          //     fontSize: CustomTheme.headline1.sp(context),
                          //   ),
                          // ),
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          Text(
                            'Signé le ${DateTime.now().formatDateyMd}',
                            style: TextStyle(
                              color: CustomTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: CustomTheme.headline1.sp(context),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          BlocBuilder<AcceptContractBloc, BaseState>(
                            builder: (context, state) {
                              final acceptContractBloc =
                                  context.read<AcceptContractBloc>();
                              return PrimaryButton(
                                width: 40.w(context),
                                onPressed: () async {
                                  bool? confirm = false;
                                  if (context
                                          .read<SignatureBloc>()
                                          .signatureAssociate ==
                                      SignatureAssociate.contract) {
                                    confirm = await showDialog<bool?>(
                                      context: context,
                                      barrierDismissible: false,
                                      barrierColor: Colors.transparent,
                                      builder: (BuildContext context) =>
                                          const ConfirmDialog(
                                        title:
                                            "Voulez-vous continuer avec l'EDL ?",
                                      ),
                                    );
                                  }
                                  if (confirm == true) {
                                    context.read<EdlBloc>().contract =
                                        signatureBloc.contract;
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      AppRoutes.edlSummary,
                                      (route) =>
                                          route.settings.name == AppRoutes.home,
                                    );
                                  } else {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            AppRoutes.home, (route) => false);
                                  }
                                  acceptContractBloc.add(
                                      const AcceptContractEvent(
                                          isAccepted: false));
                                  acceptContractBloc.add(
                                      const AcceptParapheEvent(
                                          isAccepted: false));
                                },
                                child: Text(
                                  'Terminer',
                                  style: TextStyle(
                                    fontSize: CustomTheme.button.sp(context),
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
