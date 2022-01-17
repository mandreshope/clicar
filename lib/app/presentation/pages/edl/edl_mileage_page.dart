import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/cubit/gauge_cubit.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlMileagePage extends StatelessWidget {
  EdlMileagePage({Key? key}) : super(key: key);

  final TextEditingController mileage = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider(
        create: (context) => GaugeCubit(),
        child: ScaffoldBody(
          child: BlocBuilder<EdlBloc, BaseState>(
            buildWhen: (prevState, currState) {
              if (currState is EdlMileageSuccessState) {
                SnackBarWidget.show(
                    context: context,
                    message: "Contract updated",
                    isError: false);
                Navigator.of(context).pushNamed(AppRoutes.edlSummaryChecklist);
              } else if (currState.status == Status.error) {
                SnackBarWidget.show(
                    context: context,
                    message: currState.message,
                    isError: true);
              }

              return prevState != currState;
            },
            builder: (context, state) {
              final edlBloc = context.read<EdlBloc>();
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
                              "kilométrage".toUpperCase(),
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
                          TextFieldFilled(
                            textInputType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [formatterInteger],
                            controller: mileage,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kilométrage obligatoire';
                              }
                              return null;
                            },
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
                                edlBloc.add(EdlMileageEvent(
                                    mileage:
                                        formatterInteger.parse(mileage.text) ??
                                            0));
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
      ),
    );
  }
}
