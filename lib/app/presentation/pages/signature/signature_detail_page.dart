import 'dart:typed_data';

import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_card.dart';
import 'package:flutter/material.dart';

class SignatureDetailPage extends StatelessWidget {
  const SignatureDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgByte = ModalRoute.of(context)!.settings.arguments as Uint8List;
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
                              height: 30,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                "signature".toUpperCase(),
                                style: TextStyle(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                  color: CustomTheme.primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            const ContractDetailCard(
                              label: "Contrat : ",
                              value: "NSQF QDD",
                              fontWeight: FontWeight.bold,
                            ),
                            const ContractDetailCard(
                              label: "Intutilé : ",
                              value: "NSQF QDD",
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            const ContractDetailCard(
                              label: "Véhicule : ",
                              value: "NSQF QDD",
                              valueTextColor: Colors.grey,
                            ),
                            const ContractDetailCard(
                              label: "Type de location : ",
                              value: "NSQF QDD",
                              valueTextColor: Colors.grey,
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            const ContractDetailCard(
                              label: "Départ : ",
                              value: "NSQF QDD",
                              valueTextColor: Colors.grey,
                            ),
                            const ContractDetailCard(
                              label: "Retour prévu : ",
                              value: "NSQF QDD",
                              valueTextColor: Colors.grey,
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
                              width: 300,
                              height: 100,
                              child: Image.memory(imgByte),
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            PrimaryButton(
                              width: 40.w(context),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.signatureSuccess);
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
