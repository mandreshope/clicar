import 'dart:io';

import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
