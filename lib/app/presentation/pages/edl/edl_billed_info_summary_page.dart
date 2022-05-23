import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlBilledInfoSummaryPage extends StatelessWidget {
  const EdlBilledInfoSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final edlBloc = context.read<EdlBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          /*IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.account);
              },
              icon: const Icon(
                Icons.settings,
              ),
            )*/
        ],
      ),
      body: ScaffoldBody(
        child: BlocBuilder<EdlBloc, BaseState>(
          buildWhen: (prevState, currState) {
            if (currState is EdlBilledInfoSuccessState) {
              SnackBarWidget.show(
                  context: context,
                  message: "Contract mis à jour avec succès",
                  isError: false);
              Navigator.of(context).pushNamed(AppRoutes.edlSummaryChecklist);
            } else if (currState.status == Status.error) {
              SnackBarWidget.show(
                  context: context, message: currState.message, isError: true);
            }

            return prevState != currState;
          },
          builder: (context, state) {
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
                        TitleWithSeparator(
                          title: edlBloc.typeEdl == TypeEdl.departure
                              ? "Départ".toUpperCase()
                              : "Retour".toUpperCase(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SecondaryButton(
                          width: double.infinity,
                          child: Text(
                            "facturation".toUpperCase(),
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
                        if (edlBloc.billedInfoList.isNotEmpty)
                          ...edlBloc.billedInfoList
                              .where((e) => e.isSelected)
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          e.label,
                                          style: TextStyle(
                                            color: CustomTheme.secondaryColor,
                                            fontSize: CustomTheme.subtitle2
                                                .sp(context),
                                          ),
                                        ),
                                        Text(
                                          "${e.amount.round()} €",
                                          style: TextStyle(
                                            color: CustomTheme.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: CustomTheme.subtitle2
                                                .sp(context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        SecondaryButton(
                          height: 40.0,
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 10.0)),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total".toUpperCase(),
                                style: TextStyle(
                                  color: CustomTheme.secondaryColor,
                                  fontSize: CustomTheme.subtitle2.sp(context),
                                ),
                              ),
                              Text(
                                "${edlBloc.billedInfoList.where((e) => e.isSelected).map((e) => e.amount).reduce((a, b) => a + b)} €",
                                style: TextStyle(
                                  color: CustomTheme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: CustomTheme.subtitle2.sp(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        Visibility(
                          visible: state.status == Status.loading,
                          child: PrimaryButton(
                            height: 50.0,
                            width: 40.w(context),
                            child: const CircularProgress(
                              color: Colors.white,
                            ),
                          ),
                          replacement: PrimaryButton(
                            width: 40.w(context),
                            onPressed: () {
                              edlBloc.add(const EdlBilledInfoEvent());
                            },
                            child: Text(
                              'Suivant'.toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.button.sp(context),
                                color: Colors.white,
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
    );
  }
}
