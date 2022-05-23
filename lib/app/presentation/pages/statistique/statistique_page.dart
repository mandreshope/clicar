import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatistiquePage extends StatelessWidget {
  const StatistiquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
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
                  child: Column(
                    children: [
                      const TitleWithSeparator(title: "Statistiques"),
                      const SizedBox(
                        height: 30,
                      ),
                      SecondaryButton(
                        onPressed: () {
                          //TODO go to chiffre d'affaire page
                          Navigator.pushNamed(context,AppRoutes.saleTurnover);
                        },
                        width: double.infinity,
                        child: Text(
                          "Chiffre d'affaires".toUpperCase(),
                          style: TextStyle(
                            fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                ?.sp(context),
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      SecondaryButton(
                        onPressed: () {
                          //TODO go to stat contrat
                        },
                        width: double.infinity,
                        child: Text(
                          "Contrat".toUpperCase(),
                          style: TextStyle(
                            fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                ?.sp(context),
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      SecondaryButton(
                        onPressed: () {
                          //TODO got to stat vehicule
                        },
                        width: double.infinity,
                        child: Text(
                          "Vehicule".toUpperCase(),
                          style: TextStyle(
                            fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                ?.sp(context),
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      SecondaryButton(
                        onPressed: () {
                          //TODO go to stat gestion de flotte page
                        },
                        width: double.infinity,
                        child: Text(
                          "Gestion de flotte".toUpperCase(),
                          style: TextStyle(
                            fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                ?.sp(context),
                            color: CustomTheme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      SecondaryButton(
                        onPressed: () {
                          //TODO go to encaissement page
                        },
                        width: double.infinity,
                        child: Text(
                          "Encaissement".toUpperCase(),
                          style: TextStyle(
                            fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                ?.sp(context),
                            color: CustomTheme.primaryColor,
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
          ),
        ),
      ),
    );
  }
}
