import 'dart:io';

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
import 'package:clicar/app/presentation/widgets/photo_size_max.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Stack(
                                      children: [
                                        Image.file(
                                          e.file!,
                                          width: 100.w(context),
                                          height: 20.h(context),
                                          fit: BoxFit.cover,
                                        ),
                                        Visibility(
                                          visible: fileSize(e.file) >= 2.0,
                                          child: const Positioned(
                                            top: 0,
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: PhotoSizeMax(),
                                          ),
                                        ),
                                        Positioned(
                                          right: 10.0,
                                          top: 10.0,
                                          child: PrimaryButton(
                                            width: 50.0,
                                            height: 50.0,
                                            backgroundColor: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.7),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(0.0)),
                                            onPressed: () async {
                                              final ImagePicker _picker =
                                                  ImagePicker();
                                              final XFile? image =
                                                  await showDialog<XFile?>(
                                                context: context,
                                                barrierDismissible: true,
                                                barrierColor:
                                                    Colors.transparent,
                                                builder:
                                                    (BuildContext context) =>
                                                        SimpleDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      CustomTheme
                                                          .defaultBorderRadius,
                                                    ),
                                                  ),
                                                  children: [
                                                    ListTile(
                                                      onTap: () async {
                                                        // Pick an image
                                                        final XFile? image =
                                                            await _picker
                                                                .pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          imageQuality: 50,
                                                        );
                                                        Navigator.of(context)
                                                            .pop(image);
                                                      },
                                                      title: const Text(
                                                        "Importer une photo",
                                                      ),
                                                    ),
                                                    ListTile(
                                                      onTap: () async {
                                                        // Pick an image
                                                        final XFile? image =
                                                            await _picker
                                                                .pickImage(
                                                          source: ImageSource
                                                              .camera,
                                                          imageQuality: 50,
                                                        );
                                                        Navigator.of(context)
                                                            .pop(image);
                                                      },
                                                      title: const Text(
                                                          "Capturer une photo"),
                                                    ),
                                                  ],
                                                ),
                                              );
                                              if (image != null) {
                                                edlBloc.add(
                                                  UpdateFileOfCameraPosEvent(
                                                    file: File(image.path),
                                                    index: edlBloc.cameraPosList
                                                        .indexOf(e),
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
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
                                  child: Stack(
                                    children: [
                                      Image.file(
                                        e.file!,
                                        width: 100.w(context),
                                        height: 20.h(context),
                                        fit: BoxFit.cover,
                                      ),
                                      Visibility(
                                        visible: fileSize(e.file) >= 2.0,
                                        child: const Positioned(
                                          top: 0,
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: PhotoSizeMax(),
                                        ),
                                      ),
                                      Positioned(
                                        right: 10.0,
                                        top: 10.0,
                                        child: PrimaryButton(
                                          width: 50.0,
                                          height: 50.0,
                                          backgroundColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.7),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.all(0.0)),
                                          onPressed: () async {
                                            final ImagePicker _picker =
                                                ImagePicker();
                                            final XFile? image =
                                                await showDialog<XFile?>(
                                              context: context,
                                              barrierDismissible: true,
                                              barrierColor: Colors.transparent,
                                              builder: (BuildContext context) =>
                                                  SimpleDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    CustomTheme
                                                        .defaultBorderRadius,
                                                  ),
                                                ),
                                                children: [
                                                  ListTile(
                                                    onTap: () async {
                                                      // Pick an image
                                                      final XFile? image =
                                                          await _picker
                                                              .pickImage(
                                                        source:
                                                            ImageSource.gallery,
                                                        imageQuality: 50,
                                                      );
                                                      Navigator.of(context)
                                                          .pop(image);
                                                    },
                                                    title: const Text(
                                                      "Importer une photo",
                                                    ),
                                                  ),
                                                  ListTile(
                                                    onTap: () async {
                                                      // Pick an image
                                                      final XFile? image =
                                                          await _picker
                                                              .pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                        imageQuality: 50,
                                                      );
                                                      Navigator.of(context)
                                                          .pop(image);
                                                    },
                                                    title: const Text(
                                                        "Capturer une photo"),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (image != null) {
                                              edlBloc.add(
                                                UpdateFileOfCameraInteriorPosEvent(
                                                  file: File(image.path),
                                                  index: edlBloc
                                                      .cameraInteriorPosList
                                                      .indexOf(e),
                                                ),
                                              );
                                            }
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
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
                                final filesExceedMaxSize = edlBloc.cameraPosList
                                    .where((e) => fileSize(e.file) >= 2.0)
                                    .toList();
                                if (filesExceedMaxSize.isNotEmpty) {
                                  SnackBarWidget.show(
                                      context: context,
                                      message:
                                          "Veuillez respecter la taille de fichier maximale pour le téléversement !",
                                      isError: true);
                                  return;
                                }
                                edlBloc.add(UploadPhotosExteriorEvent(files: [
                                  ...edlBloc.cameraPosList.map((e) => e.file!)
                                ]));
                              } else if (typePhotoArgs ==
                                  TypePhotoArgs.interior) {
                                final filesExceedMaxSize = edlBloc
                                    .cameraInteriorPosList
                                    .where((e) => fileSize(e.file) >= 2.0)
                                    .toList();
                                if (filesExceedMaxSize.isNotEmpty) {
                                  SnackBarWidget.show(
                                      context: context,
                                      message:
                                          "Veuillez respecter la taille de fichier maximale pour le téléversement !",
                                      isError: true);
                                  return;
                                }
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
