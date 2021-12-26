import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SignatureSuccessPage extends StatelessWidget {
  const SignatureSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
      appBar: AppBar(
        elevation: 0,
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
                              height: CustomTheme.extraSpacer,
                            ),
                            const SuccessIcon(
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(
                              height: CustomTheme.extraSpacer,
                            ),
                            Text(
                              "Contrat ERIEO SD",
                              style: TextStyle(
                                color: CustomTheme.primaryColor,
                                fontSize: CustomTheme.headline1.sp(context),
                              ),
                            ),
                            Text(
                              "Contrat ERIEO SD",
                              style: TextStyle(
                                color: CustomTheme.primaryColor,
                                fontSize: CustomTheme.headline1.sp(context),
                              ),
                            ),
                            Text(
                              "RIEO SD",
                              style: TextStyle(
                                color: CustomTheme.primaryColor,
                                fontSize: CustomTheme.headline1.sp(context),
                              ),
                            ),
                            const SizedBox(
                              height: CustomTheme.extraSpacer,
                            ),
                            Text(
                              "Signé le 12/12/2021 à 23/12/2022",
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
                            PrimaryButton(
                              width: 40.w(context),
                              onPressed: () async {
                                final bool? confirm = await showDialog<bool?>(
                                  context: context,
                                  barrierDismissible: false,
                                  barrierColor: Colors.transparent,
                                  builder: (BuildContext context) =>
                                      const ConfirmDialog(
                                          title:
                                              "Voulez-vous continuer avec l'EDL ?"),
                                );
                                if (confirm == true) {
                                  ///TODO: go to EDL départ
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.home, (route) => false);
                                }
                              },
                              child: Text(
                                'Terminer',
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
