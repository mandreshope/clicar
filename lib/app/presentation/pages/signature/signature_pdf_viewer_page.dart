import 'dart:io';

import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SignaturePdfViewerPage extends StatefulWidget {
  const SignaturePdfViewerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignaturePdfViewerPage> createState() => _SignaturePdfViewerPageState();
}

class _SignaturePdfViewerPageState extends State<SignaturePdfViewerPage> {
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    final file = navigatorArgs(context) as File?;
    final signatureBloc = context.read<SignatureBloc>();
    String typeText = "";
    dynamic num;
    switch (signatureBloc.signatureAssociate) {
      case SignatureAssociate.contract:
        typeText = "Contrat";
        num = signatureBloc.contract.numberContrat;
        break;
      case SignatureAssociate.reservation:
        typeText = "Réservation";
        num = signatureBloc.reservation.numberReservation;
        break;
      default:
        typeText = "Bon de commande";
        num = signatureBloc.bdc.numberContrat;
        break;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("$typeText : $num"),
        actions: [
          Visibility(
            visible: isLastPage,
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.signatureDraw);
              },
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: SfPdfViewer.file(
        file!,
        onPageChanged: (PdfPageChangedDetails details) {
          if (details.isLastPage) {
            isLastPage = true;
            setState(() {});
          }
        },
      ),
    );
  }
}
