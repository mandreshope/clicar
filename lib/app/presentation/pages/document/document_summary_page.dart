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

class DocumentSummaryPage extends StatelessWidget {
  const DocumentSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final documentBloc = context.read<DocumentBloc>();
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
                    TitleWithSeparator(
                      title: "ajout pièces".toUpperCase(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ...documentBloc.documentPickers
                        .map(
                          (documentPicker) => Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Image.memory(
                                  documentPicker.file.readAsBytesSync(),
                                  width: 100.w(context),
                                  height: 20.h(context),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                documentPicker.type!.label,
                                style: TextStyle(
                                  fontSize: CustomTheme.subtitle1.sp(context),
                                ),
                              ),
                              Text(
                                documentPicker.associated!.label,
                                style: TextStyle(
                                  fontSize: CustomTheme.subtitle1.sp(context),
                                ),
                              ),
                              Text(
                                documentPicker.associatedSelectedName!,
                                style: TextStyle(
                                  fontSize: CustomTheme.subtitle1.sp(context),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    const SizedBox(
                      height: CustomTheme.spacer,
                    ),
                    BlocBuilder<DocumentBloc, BaseState>(
                      buildWhen: (prevState, currState) {
                        if (currState is UploadDocumentsSuccessState) {
                          documentBloc.add(AssociateDocumentsEvent());
                        } else if (currState
                            is AssociateDocumentsSuccessState) {
                          SnackBarWidget.show(
                              context: context,
                              message: currState.message,
                              isError: false);
                          if (documentBloc.documentsUploadedCounter ==
                              documentBloc.documentsUploaded.length) {
                            documentBloc.reset();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.home,
                              (route) => route.settings.name == AppRoutes.home,
                            );
                          }
                        } else if (currState.status == Status.error) {
                          SnackBarWidget.show(
                              context: context,
                              message: currState.message,
                              isError: true);
                        }

                        return prevState != currState;
                      },
                      builder: (context, state) {
                        return Visibility(
                          visible: documentBloc.documentPickers
                                  .where((e) =>
                                      e.type != null &&
                                      e.associated != null &&
                                      e.associatedSelectedName != null)
                                  .length ==
                              documentBloc.documentPickers.length,
                          child: Visibility(
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
                                documentBloc.add(UploadDocumentsEvent());
                              },
                              child: Text(
                                'Envoyer'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: CustomTheme.button.sp(context),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
