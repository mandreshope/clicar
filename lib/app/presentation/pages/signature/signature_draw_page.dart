import 'dart:typed_data';

import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureDrawPage extends StatelessWidget {
  SignatureDrawPage({Key? key}) : super(key: key);

  // Initialise a controller. It will contains signature points, stroke width and pen color.
// It will allow you to interact with the widget
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.grey,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              _controller.undo();
            },
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: () {
              _controller.redo();
            },
          ),
          //CLEAR CANVAS
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          DraggableScrollableSheet(
            initialChildSize: 1.0,
            minChildSize: 1.0,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
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
                              height: CustomTheme.spacer,
                            ),
                            CheckboxListTile(
                              activeColor: CustomTheme.primaryColor,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: const EdgeInsets.all(0.0),
                              value: true,
                              onChanged: (v) {},
                              title: Text(
                                "Bon pour accord",
                                style: TextStyle(
                                  fontSize: CustomTheme.subtitle2.sp(context),
                                  color: CustomTheme.primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            ContainerRoundedGrey(
                              child: Signature(
                                controller: _controller,
                                width: 300,
                                height: 40.h(context),
                                backgroundColor: CustomTheme.greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            PrimaryButton(
                              width: 40.w(context),
                              onPressed: () async {
                                if (_controller.isNotEmpty) {
                                  final Uint8List? data =
                                      await _controller.toPngBytes();
                                  if (data != null) {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.signatureDetail,
                                        arguments: data);
                                  }
                                } else {
                                  SnackBarWidget.show(
                                    isError: true,
                                    message: "Votre signature svp !",
                                    context: context,
                                  );
                                }
                              },
                              child: Text(
                                'Signer',
                                style: TextStyle(
                                  fontSize: CustomTheme.button.sp(context),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
    );
  }
}
