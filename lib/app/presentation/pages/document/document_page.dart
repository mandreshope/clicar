import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/document/bloc/document_bloc.dart';
import 'package:clicar/app/presentation/pages/document/widgets/document_expandable.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/cubit/gauge_cubit.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/percent_slider.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({Key? key}) : super(key: key);

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
      body: ScaffoldBody(
        child: BlocBuilder<DocumentBloc, BaseState>(
          buildWhen: (prevState, currState) {
            if (currState is EdlFuelLevelSuccessState) {
              SnackBarWidget.show(
                  context: context,
                  message: "Contract mis à jour avec succès",
                  isError: false);
              Navigator.of(context).pushNamed(AppRoutes.edlMileage);
            } else if (currState.status == Status.error) {
              SnackBarWidget.show(
                  context: context, message: currState.message, isError: true);
            }

            return prevState != currState;
          },
          builder: (context, state) {
            final documentBloc = context.read<DocumentBloc>();
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
                          title: "ajout pièces".toUpperCase(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ...documentBloc.documentPickers
                            .map(
                              (e) => DocumentExpandable(documentPicker: e),
                            )
                            .toList(),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        Visibility(
                          visible: documentBloc.documentPickers
                                  .where((e) =>
                                      e.type != null && e.type!.type != "Autres" &&
                                      e.associated != null &&
                                      e.associatedSelectedName != null)
                                  .length ==
                              documentBloc.documentPickers.length,
                          child: PrimaryButton(
                            width: 40.w(context),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.documentSummary);
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
