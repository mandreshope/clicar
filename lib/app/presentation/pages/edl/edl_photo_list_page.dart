import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_photo_args.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlPhotoListPage extends StatelessWidget {
  const EdlPhotoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typePhotoArgs = navigatorArgs(context) as TypePhotoArgs;
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
            if (currState is UploadPhotosExteriorSuccess) {
              SnackBarWidget.show(
                context: context,
                message: "Photos exterior uploaded",
                isError: false,
              );
              context.read<EdlBloc>().add(EdlPhotosEvent());
            } else if (currState is UploadPhotosInteriorSuccess) {
              SnackBarWidget.show(
                context: context,
                message: "Photos interior uploaded",
                isError: false,
              );
              context.read<EdlBloc>().add(EdlPhotosEvent());
            } else if (currState is EdlPhotosSuccessState) {
              SnackBarWidget.show(
                context: context,
                message: "Contract updated",
                isError: false,
              );
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else if (currState.status == Status.error) {
              SnackBarWidget.show(
                  context: context, message: currState.message, isError: true);
            } else if (currState is ErrorState) {
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

                        ///Photos list
                        if (typePhotoArgs == TypePhotoArgs.exterior) ...[
                          SecondaryButton(
                            width: double.infinity,
                            child: Text(
                              "photos extérieures".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...edlBloc.cameraPosList
                              .map(
                                (e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Image.file(
                                    e.file!,
                                    width: 100.w(context),
                                    height: 20.h(context),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                              .toList(),
                        ] else if (typePhotoArgs == TypePhotoArgs.interior) ...[
                          SecondaryButton(
                            width: double.infinity,
                            child: Text(
                              "photos intérieures".toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...edlBloc.cameraInteriorPosList
                              .map(
                                (e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Image.file(
                                    e.file!,
                                    width: 100.w(context),
                                    height: 20.h(context),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                              .toList(),
                        ],

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
                              if (typePhotoArgs == TypePhotoArgs.exterior) {
                                edlBloc.add(UploadPhotosExteriorEvent(files: [
                                  ...edlBloc.cameraPosList.map((e) => e.file!)
                                ]));
                              } else if (typePhotoArgs ==
                                  TypePhotoArgs.interior) {
                                edlBloc.add(UploadPhotosInteriorEvent(files: [
                                  ...edlBloc.cameraInteriorPosList
                                      .map((e) => e.file!)
                                ]));
                              } else {
                                throw UnimplementedError();
                              }
                            },
                            child: Text(
                              'Valider'.toUpperCase(),
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
