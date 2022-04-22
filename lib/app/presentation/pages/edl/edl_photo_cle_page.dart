import 'dart:io';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_photo_args.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EdlPhotoClePage extends StatefulWidget {
  EdlPhotoClePage({Key? key}) : super(key: key);

  @override
  State<EdlPhotoClePage> createState() => _EdlPhotoClePageState();
}

class _EdlPhotoClePageState extends State<EdlPhotoClePage> {
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
        ),
        body: ScaffoldBody(
            child: BlocBuilder<EdlBloc, BaseState>(
          buildWhen: (prevState, currState) {
            if (currState.status == Status.error) {
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
                        Stack(
                          children: [
                            SizedBox(
                              width: 100.w(context),
                              height: 65.h(context),
                            ),
                            Positioned(
                              top: 10.0,
                              left: 0.0,
                              right: 0.0,
                              child: Column(
                                children: [
                                  Text(
                                    "Prenez une photos du clé",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            CustomTheme.subtitle1.sp(context)),
                                  ),
                                  Text(
                                    "Veuillez à ce qu'elle soient nettes.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            CustomTheme.subtitle1.sp(context)),
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
                                        fontSize:
                                            CustomTheme.bodyText1.sp(context)),
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
                                    if (edlBloc.cle != null) {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.edlPhotoList,
                                        arguments: TypePhotoArgs.cle,
                                      );
                                      return;
                                    }

                                    if (edlBloc.imageSource != null) {
                                        final XFile? image =
                                            await _picker.pickImage(
                                          source: edlBloc.imageSource!,
                                          imageQuality: 50,
                                        );
                                        if (image != null) {
                                          edlBloc.add(
                                            AddFileOfCleEvent(
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
                                              Navigator.of(context).pop(image);
                                            },
                                            title: const Text(
                                              "Importer une photo",
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              // capture an image
                                              final XFile? image =
                                                  await _picker.pickImage(
                                                source: ImageSource.camera,
                                                imageQuality: 50,
                                              );
                                              edlBloc.imageSource =
                                                  ImageSource.camera;
                                              Navigator.of(context).pop(image);
                                            },
                                            title:
                                                const Text("Prendre une photo"),
                                          ),
                                        ],
                                      ),
                                    );

                                    if (image != null) {
                                      edlBloc.add(
                                        AddFileOfCleEvent(
                                          file: File(image.path),
                                        ),
                                      );
                                    }
                                  },
                                  backgroundColor: CustomTheme.secondaryColor,
                                  width: 80.0,
                                  height: 80.0,
                                  child: Icon(
                                    edlBloc.cle != null
                                        ? Icons.check
                                        : Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
