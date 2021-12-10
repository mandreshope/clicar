import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:clicar/core/utils/extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: CustomTheme.primaryColor,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: Responsive.height(context) -
                      (Responsive.height(context) * 0.8),
                  child: Center(
                    child: Image.asset(
                      "${assetsImages}clicar_logo.png",
                      scale: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.8,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 05.h(context).sp(context),
                          horizontal: 10.w(context).sp(context),
                        ),
                        child: Column(
                          children: [
                            const TitleWithSeparator(title: "Menu"),
                            const SizedBox(
                              height: 30,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Signature des contrats',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Réaliser un départ',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Réaliser un retour',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Joindre des documents',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Consulter les statistiques',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
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
