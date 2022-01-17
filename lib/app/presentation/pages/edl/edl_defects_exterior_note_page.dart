import 'dart:typed_data';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
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

class EdlDefectsExteriorNotePage extends StatefulWidget {
  const EdlDefectsExteriorNotePage({Key? key}) : super(key: key);

  @override
  State<EdlDefectsExteriorNotePage> createState() =>
      _EdlDefectsExteriorNotePageState();
}

class _EdlDefectsExteriorNotePageState
    extends State<EdlDefectsExteriorNotePage> {
  final TextEditingController departureNote = TextEditingController();

  final TextEditingController retourNote = TextEditingController();

  @override
  void initState() {
    super.initState();
    final edlBloc = context.read<EdlBloc>();
    departureNote.text = edlBloc.contract.conditionAtStart?.comment ?? "";
  }

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
        child: BlocBuilder<EdlBloc, BaseState>(
          buildWhen: (prevState, currState) {
            if (currState is EdlDepartureNoteSuccessState) {
              SnackBarWidget.show(
                context: context,
                message: "Les remarques sont envoyées",
                isError: false,
              );
              Navigator.of(context).pushNamed(AppRoutes.edlFuelLevel);
            }
            if (currState is EdlRetourNoteSuccessState) {
              SnackBarWidget.show(
                context: context,
                message: "Les remarques sont envoyées",
                isError: false,
              );
              Navigator.of(context).pushNamed(AppRoutes.edlFuelLevel);
            } else if (currState.status == Status.error) {
              SnackBarWidget.show(
                  context: context, message: currState.message, isError: true);
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
                            "défauts extérieures".toUpperCase(),
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

                        ///note departure
                        TextFieldFilled(
                          textInputType: TextInputType.multiline,
                          labelText: "Remarques départ",
                          maxLines: 5,
                          controller: departureNote,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'note obligatoire';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),

                        if (edlBloc.typeEdl == TypeEdl.retour) ...[
                          ///note retour
                          TextFieldFilled(
                            textInputType: TextInputType.multiline,
                            labelText: "Remarques retour",
                            maxLines: 5,
                            controller: retourNote,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Remarques retour obligatoire';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                        ],

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
                            onPressed: () async {
                              if (edlBloc.typeEdl == TypeEdl.departure) {
                                edlBloc.add(EdlDepartureNoteEvent(
                                    note: departureNote.text));
                              } else {
                                edlBloc.add(
                                    EdlRetourNoteEvent(note: retourNote.text));
                              }
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
