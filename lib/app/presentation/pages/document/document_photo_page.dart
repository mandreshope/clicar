import 'dart:io';
import 'dart:ui';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/account/bloc/account/account_bloc.dart';
import 'package:clicar/app/presentation/pages/document/bloc/document_bloc.dart';
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

class DocumentPhotoPage extends StatefulWidget {
  const DocumentPhotoPage({Key? key}) : super(key: key);

  @override
  State<DocumentPhotoPage> createState() => _DocumentPhotoPageState();
}

class _DocumentPhotoPageState extends State<DocumentPhotoPage> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<DocumentBloc>().reset();
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
          child: BlocBuilder<DocumentBloc, BaseState>(
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
                          Stack(
                            children: [
                              SizedBox(
                                width: 100.w(context),
                                height: 65.h(context),
                              ),
                              ContainerRoundedGrey(
                                width: 100.w(context),
                                height: 60.h(context),
                                child: Center(
                                  child: SizedBox(
                                    width: 70.w(context),
                                    height: 25.h(context),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1- Prendre en photo les pièces",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: CustomTheme.subtitle1.sp(
                                              context,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "2- Renommer les pièces",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: CustomTheme.subtitle1.sp(
                                              context,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "3- Associer les pièces",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: CustomTheme.subtitle1.sp(
                                              context,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10.0,
                                left: 0.0,
                                right: 0.0,
                                child: Column(
                                  children: [
                                    Text(
                                      "Prendre en photos tous les documents",
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
                                                    await _picker.pickImage(
                                                  source: ImageSource.camera,
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
                                        documentBloc.add(
                                          AddDocumentPickerEvent(
                                            file: File(image.path),
                                          ),
                                        );
                                      }
                                    },
                                    backgroundColor: CustomTheme.secondaryColor,
                                    width: 80.0,
                                    height: 80.0,
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible:
                                    documentBloc.documentPickers.isNotEmpty,
                                child: Positioned(
                                  bottom: 20.0,
                                  right: 50.0,
                                  child: Center(
                                    child: PrimaryButton(
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(0.0)),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pushNamed(AppRoutes.document);
                                      },
                                      backgroundColor:
                                          CustomTheme.secondaryColor,
                                      width: 40.0,
                                      height: 40.0,
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
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
