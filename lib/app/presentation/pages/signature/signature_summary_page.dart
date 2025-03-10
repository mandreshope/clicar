import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/widgets/bdc_detail_card.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_card.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/reservation_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignatureSummaryPage extends StatelessWidget {
  const SignatureSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignatureAssociate signatureAssociate =
        navigatorArgs(context) as SignatureAssociate;
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Stack(
          children: [
            BlocBuilder<SignatureBloc, BaseState>(
              buildWhen: (prevState, currState) {
                return prevState != currState;
              },
              builder: (context, state) {
                return DraggableScrollableSheet(
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
                                  if (signatureAssociate ==
                                      SignatureAssociate.contract) ...[
                                    SecondaryButton(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          context
                                                  .read<SignatureBloc>()
                                                  .contract
                                                  .vehicle
                                                  ?.immat1 ??
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
                                  ] else if (signatureAssociate ==
                                      SignatureAssociate.reservation) ...[
                                    SecondaryButton(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          context
                                                  .read<SignatureBloc>()
                                                  .reservation
                                                  .vehicule?.immat1 ??
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
                                  ] else if (signatureAssociate ==
                                      SignatureAssociate.bdc) ...[
                                    SecondaryButton(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          context
                                                  .read<SignatureBloc>()
                                                  .bdc
                                                  .numberContrat ??
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
                                  ],
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
                                  if (signatureAssociate ==
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
                                  ] else if (signatureAssociate ==
                                      SignatureAssociate.reservation) ...[
                                    ReservationtDetailCard(
                                      reservation: context
                                          .read<SignatureBloc>()
                                          .reservation
                                          .numberReservation,
                                      intutile: context
                                          .read<SignatureBloc>()
                                          .reservation
                                          .customer
                                          ?.firstName,
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
                                  ] else if (signatureAssociate ==
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
                                      intutile: context
                                          .read<SignatureBloc>()
                                          .bdc
                                          .customer
                                          ?.firstName,
                                    )
                                  ],
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  const SizedBox(
                                    height: CustomTheme.spacer,
                                  ),
                                  PrimaryButton(
                                    width: 40.w(context),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          AppRoutes.signatureConfirm,
                                          arguments: signatureAssociate);
                                    },
                                    child: Text(
                                      'Signer',
                                      style: TextStyle(
                                        fontSize:
                                            CustomTheme.button.sp(context),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                "${assetsImages}logo.png",
                                width: 200,
                                height: 30,
                              ),
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            //footer
            /*const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: BottomLogo(),
            )*/
          ],
        ),
      ),
    );
  }
}
