import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/item_amount_card.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/item_stat_card.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/option_filter_card.dart';
import 'package:clicar/app/presentation/pages/statistique/widget/user_stat_card.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';

class SaleTurnoverPage extends StatelessWidget {
  const SaleTurnoverPage({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 05.h(context).sp(context),
                    horizontal: 5.w(context).sp(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      const TitleWithSeparator(title: "Chiffre d'affaires"),
                      OptionFilterCard(filterWithDay: (){},),
                      const ItemAmountCard(
                        title: "Montant à encaissé",
                        amount: "0.00",
                        percentage: 0.00,
                      ),
                      const ItemAmountCard(
                        title: "Retard Encaissement",
                        amount: "0.00",
                        percentage: 0.00,
                      ),
                      const ItemAmountCard(
                        title: "Retard globale",
                        amount: "0.00",
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Objectif CA",
                                        style: TextStyle(
                                            color: const Color(0xFF8f94b2),
                                            fontSize: CustomTheme.headline4,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "€ 0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: CustomTheme.headline3,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Accomplissement",
                                        style: TextStyle(
                                            color: const Color(0xFF8f94b2),
                                            fontSize: CustomTheme.headline4,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "€ 0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: CustomTheme.headline3,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Agent de facturation",
                                  style: TextStyle(
                                      fontSize: CustomTheme.headline4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const UserStatCard(
                                  lastName: "lastName",
                                  firstName: "firstName",
                                  type: "Facturation",
                                  stat: 0),
                              const UserStatCard(
                                  lastName: "lastName",
                                  firstName: "firstName",
                                  type: "Facturation",
                                  stat: 0),
                              const UserStatCard(
                                  lastName: "lastName",
                                  firstName: "firstName",
                                  type: "Facturation",
                                  stat: 0),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          children: const [
                            ItemStatCard(
                                trailing: Text("€ 0"),
                                color: Colors.blue,
                                info: "Montant facturé"),
                            ItemStatCard(
                                trailing: Text("€ 0"),
                                color: Colors.blue,
                                info: "Montant facturé"),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            Text(
                              "Retard facture diverse",
                              style: TextStyle(
                                  color: const Color(0xFF8f94b2),
                                  fontSize: CustomTheme.headline4,
                                  fontWeight: FontWeight.bold),
                            ),
                            const ItemStatCard(
                                trailing: Text("0%"),
                                color: Colors.blue,
                                info: "Contravention"),
                            const ItemStatCard(
                                trailing: Text("0%"),
                                color: Colors.blue,
                                info: "Dépôt de garantie"),
                          ],
                        ),
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
