import 'dart:io';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/widgets/bdc_detail_card.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_card.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/reservation_detail_card.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signature_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SignatureConfimPage extends StatelessWidget {
  const SignatureConfimPage({Key? key}) : super(key: key);

  Future<File?> buildPdf() async {
    final pdf = pw.Document();

    List.generate(
        6,
        (index) => pdf.addPage(
              pw.Page(
                pageFormat: PdfPageFormat.a4,
                build: (pw.Context context) {
                  return pw.Column(children: [
                    pw.Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    ),
                  ]);
                },
              ),
            ));

    ///convert pngBytes to file
    final path = await localPath;
    File file = File('$path/pdfSignature.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

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
        body: ScaffoldBody(
          child: BlocBuilder<SignatureBloc, BaseState>(
            buildWhen: (prevState, currState) {
              if (currState is GetPdfContractSuccessState) {
                context.read<SignatureBloc>().add(DownloadFileEvent(
                      path: currState.uploadFile!.path!,
                      fileName: currState.uploadFile!.filename!,
                    ));
              } else if (currState is GetPdfReservationSuccessState) {
                context.read<SignatureBloc>().add(DownloadFileEvent(
                      path: currState.uploadFile!.path!,
                      fileName: currState.uploadFile!.filename!,
                    ));
              } else if (currState is DownloadFileSuccessState &&
                  currState.file.path.isNotEmpty) {
                Navigator.of(context).pushNamed(AppRoutes.signaturePdfViewer,
                    arguments: currState.file);
              } else if (currState is ErrorState) {
                SnackBarWidget.show(
                  context: context,
                  message: currState.message,
                  isError: true,
                );
              }
              return prevState != currState;
            },
            builder: (context, state) {
              final signatureBloc = context.read<SignatureBloc>();
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
                            height: CustomTheme.extraSpacer,
                          ),
                          if (signatureAssociate ==
                              SignatureAssociate.contract) ...[
                            ContractDetailCard(
                              contract: signatureBloc.contract.numberContrat,
                              intutile: signatureBloc.contract.customer?.firstName,
                              vehicle: signatureBloc.contract.vehicle?.mark,
                              typeLocation: signatureBloc
                                  .contract.rate?.rent?.first.locationType,
                              departureDate:
                                  signatureBloc.contract.info?.departureDate,
                              returnDate:
                                  signatureBloc.contract.info?.returnDate,
                              immat: signatureBloc.contract.vehicle?.immat1,
                            ),
                          ] else if (signatureAssociate ==
                              SignatureAssociate.reservation) ...[
                            ReservationtDetailCard(
                              reservation:
                                  signatureBloc.reservation.numberReservation,
                              intutile:
                                  signatureBloc.reservation.customer?.firstName,
                              vehicle: signatureBloc.reservation.vehicule?.mark,
                              typeLocation: signatureBloc
                                  .reservation.rate?.rent?.first.locationType,
                              departureDate:
                                  signatureBloc.reservation.info?.departureDate,
                              returnDate:
                                  signatureBloc.reservation.info?.returnDate,
                              immat: signatureBloc.reservation.vehicule?.immat1,
                            )
                          ] else if (signatureAssociate ==
                              SignatureAssociate.bdc) ...[
                            BdcDetailCard(
                              bdc: signatureBloc.bdc.numberContrat,
                              typeLocation: signatureBloc
                                  .bdc.rate?.rent?.first.locationType,
                              departureDate:
                                  signatureBloc.bdc.info?.departureDate,
                              returnDate: signatureBloc.bdc.info?.returnDate,
                              vehicle:
                                  signatureBloc.bdc.vehicleBooking?.markAndType,
                              intutile: signatureBloc.bdc.customer?.firstName,
                            )
                          ],
                          const SizedBox(
                            height: CustomTheme.extraSpacer,
                          ),
                          Visibility(
                            visible: state.status == Status.loading,
                            child: const SecondaryButton(
                              height: 100,
                              width: double.infinity,
                              child: CircularProgress(),
                            ),
                            replacement: SecondaryButton(
                              onPressed: () async {
                                switch (signatureAssociate) {
                                  case SignatureAssociate.contract:
                                    {
                                      signatureBloc.add(GetPdfContractEvent(
                                        contract: signatureBloc.contract,
                                      ));
                                    }
                                    break;
                                  case SignatureAssociate.reservation:
                                    {
                                      signatureBloc.add(GetPdfReservationEvent(
                                        reservation: signatureBloc.reservation,
                                      ));
                                    }
                                    break;
                                  default:
                                    {
                                      signatureBloc.add(GetPdfBdcEvent(
                                        bdc: signatureBloc.bdc,
                                      ));
                                    }
                                    break;
                                }
                              },
                              height: 100,
                              width: double.infinity,
                              child: Text(
                                "cliquer ici pour signer".toUpperCase(),
                                style: TextStyle(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                  color: Colors.grey,
                                ),
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
