import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/statistique/bloc/stat_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class StatistiquePage extends StatefulWidget {
  const StatistiquePage({Key? key}) : super(key: key);

  @override
  State<StatistiquePage> createState() => _StatistiquePageState();
}

class _StatistiquePageState extends State<StatistiquePage> {
  Map<String, dynamic>? data;
  String? dateBegin;
  String? dateEnd;
  String? week;
  String? month;
  String? day;

  @override
  void initState() {
    dateBegin = DateTime.now().toString().split(' ')[0];
    dateEnd = Jiffy().add(months: 1).dateTime.toString().split(' ')[0];
    day = DateTime.now().toString().split(" ")[0];
    month = DateFormat('yyyy-MM').format(DateTime.now()).toString();
    int tempWeek = Jiffy(DateTime.now()).week;
    int tempYear = Jiffy(DateTime.now()).year;
    if (tempWeek < 10) {
      week = "$tempYear-W0$tempWeek";
    } else {
      week = "$tempYear-W$tempWeek";
    }
    data = {
      "filter": "day",
      "month": month,
      "filtreRangeBegin": dateBegin,
      "filtreRangeEnd": dateEnd,
      "day": day,
      "week": week,
    };
    super.initState();
  }

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
                          Navigator.pushNamed(context, AppRoutes.saleTurnover);
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
                          //Todo got to stat vehicule
                          context
                              .read<StatBloc>()
                              .add(GetListVehicleStatEvent());
                          Navigator.pushNamed(context, AppRoutes.listVehicle);
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
                          //Todo go to stat gestion de flotte page
                          context
                              .read<StatBloc>()
                              .add(GetStatFlotteEvent(data: data!));
                          Navigator.pushNamed(context, AppRoutes.flotte);
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
                          //Todo go to encaissement page
                          context
                              .read<StatBloc>()
                              .add(GetStatEncaissementEvent(data: data!));
                          Navigator.pushNamed(context, AppRoutes.encaissement);
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
