import 'dart:io';
import 'dart:ui';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/account/bloc/account/account_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_photo_args.dart';
import 'package:clicar/app/presentation/pages/edl/widgets/camera_pos_car_exterior.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';

class EdlPhotoExteriorPage extends StatefulWidget {
  const EdlPhotoExteriorPage({Key? key}) : super(key: key);

  @override
  State<EdlPhotoExteriorPage> createState() => _EdlPhotoExteriorPageState();
}

class _EdlPhotoExteriorPageState extends State<EdlPhotoExteriorPage> {
  double value = 0.0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<EdlBloc>().imageSource = null;
        return Future.value(true);
      },
      child: Scaffold(
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
              if (currState.status == Status.error) {
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
                          /*Slider(
                              min: 0.0,
                              max: 2 * math.pi,
                              value: value,
                              onChanged: (v) {
                                setState(() {
                                  value = math.pi * v;
                                  print(value);
                                });
                              }),*/
                          const SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                width: 100.w(context),
                                height: 65.h(context),
                              ),
                              ContainerRoundedGrey(
                                width: 100.w(context),
                                height: 60.h(context),
                                child: const Center(
                                  child: CameraPosCarExterior(),
                                ),
                              ),
                              Positioned(
                                top: 10.0,
                                left: 0.0,
                                right: 0.0,
                                child: Column(
                                  children: [
                                    Text(
                                      "Prenez 8 photos extérieures",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: CustomTheme.subtitle1
                                              .sp(context)),
                                    ),
                                    Text(
                                      "Veuillez à ce qu'elle soient nettes.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: CustomTheme.subtitle1
                                              .sp(context)),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "La taille de téléchargement \n maximale est de 2 Mo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: CustomTheme.bodyText1
                                              .sp(context)),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0.0,
                                right: 0.0,
                                child: Center(
                                  child: PrimaryButton(
                                    onPressed: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      if (edlBloc.cameraPosList
                                          .where((e) => e.hasPhoto == false)
                                          .isEmpty) {
                                        Navigator.of(context).pushNamed(
                                          AppRoutes.edlPhotoList,
                                          arguments: TypePhotoArgs.exterior,
                                        );
                                        return;
                                      }

                                      if (edlBloc.imageSource != null) {
                                        final XFile? image =
                                            await _picker.pickImage(
                                          source: edlBloc.imageSource!,
                                          imageQuality: 50,
                                        );
                                        if (edlBloc.imageSource ==
                                            ImageSource.camera) {
                                          await Navigator.of(context).pushNamed(
                                              AppRoutes.edlCameraExterior);
                                          edlBloc.add(ReloadEvent());
                                        }
                                        if (image != null) {
                                          edlBloc.add(
                                            AddFileOfCameraPosEvent(
                                              file: File(image.path),
                                            ),
                                          );
                                        }
                                        return;
                                      }

                                      final XFile? image =
                                          await showDialog<XFile?>(
                                        context: context,
                                        barrierDismissible: true,
                                        barrierColor: Colors.transparent,
                                        builder: (BuildContext context) =>
                                            SimpleDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              CustomTheme.defaultBorderRadius,
                                            ),
                                          ),
                                          children: [
                                            ListTile(
                                              onTap: () async {
                                                // Pick an image
                                                final XFile? image =
                                                    await _picker.pickImage(
                                                  source: ImageSource.gallery,
                                                  imageQuality: 50,
                                                );
                                                edlBloc.imageSource =
                                                    ImageSource.gallery;
                                                Navigator.of(context)
                                                    .pop(image);
                                              },
                                              title: const Text(
                                                "Importer une photo",
                                              ),
                                            ),
                                            ListTile(
                                              onTap: () async {
                                                Navigator.of(context).pop();
                                                edlBloc.imageSource =
                                                    ImageSource.camera;
                                                // Capture an image
                                                await Navigator.of(context)
                                                    .pushNamed(AppRoutes
                                                        .edlCameraExterior);
                                                edlBloc.add(ReloadEvent());

                                                /*final XFile? image =
                                                    await _picker.pickImage(
                                                  source: ImageSource.camera,
                                                  imageQuality: 50,
                                                );
                                                Navigator.of(context).pop(image);*/
                                              },
                                              title: const Text(
                                                  "Prendre une photo"),
                                            ),
                                          ],
                                        ),
                                      );

                                      if (image != null) {
                                        edlBloc.add(
                                          AddFileOfCameraPosEvent(
                                            file: File(image.path),
                                          ),
                                        );
                                      }
                                    },
                                    backgroundColor: CustomTheme.secondaryColor,
                                    width: 80.0,
                                    height: 80.0,
                                    child: Icon(
                                      edlBloc.cameraPosList
                                              .where((e) => e.hasPhoto == false)
                                              .isEmpty
                                          ? Icons.check
                                          : Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
