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
                              child: Center(
                                child: SizedBox(
                                  width: 70.w(context),
                                  height: 25.h(context),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: edlBloc.cameraPosList
                                            .map(
                                              (e) => e.alignment ==
                                                      Alignment.topCenter
                                                  ? InkWell(
                                                      onTap: () {
                                                        edlBloc.add(
                                                          SelectCameraPosEvent(
                                                            cameraPos: e,
                                                          ),
                                                        );
                                                      },
                                                      child: Transform.rotate(
                                                        angle:
                                                            e.rotation ?? 0.0,
                                                        child: Image.asset(
                                                          e.isActive ||
                                                                  e.hasPhoto
                                                              ? "${assetsImages}camera_active.png"
                                                              : "${assetsImages}camera_inactive.png",
                                                          width: 60,
                                                          height: 60,
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                            )
                                            .toList(),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //devant
                                          ...edlBloc.cameraPosList
                                              .map(
                                                (e) => e.alignment ==
                                                        Alignment.centerLeft
                                                    ? InkWell(
                                                        onTap: () {
                                                          edlBloc.add(
                                                            SelectCameraPosEvent(
                                                              cameraPos: e,
                                                            ),
                                                          );
                                                        },
                                                        child: Transform.rotate(
                                                          angle:
                                                              e.rotation ?? 0.0,
                                                          child: Image.asset(
                                                            e.isActive ||
                                                                    e.hasPhoto
                                                                ? "${assetsImages}camera_active.png"
                                                                : "${assetsImages}camera_inactive.png",
                                                            width: 60,
                                                            height: 60,
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                              )
                                              .toList(),
                                          Image.asset(
                                            "${assetsImages}top_view_citadine.png",
                                            width: 130,
                                          ),
                                          ...edlBloc.cameraPosList
                                              .map(
                                                (e) => e.alignment ==
                                                        Alignment.centerRight
                                                    ? InkWell(
                                                        onTap: () {
                                                          edlBloc.add(
                                                            SelectCameraPosEvent(
                                                              cameraPos: e,
                                                            ),
                                                          );
                                                        },
                                                        child: Transform.rotate(
                                                          angle:
                                                              e.rotation ?? 0.0,
                                                          child: Image.asset(
                                                            e.isActive ||
                                                                    e.hasPhoto
                                                                ? "${assetsImages}camera_active.png"
                                                                : "${assetsImages}camera_inactive.png",
                                                            width: 60,
                                                            height: 60,
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox.shrink(),
                                              )
                                              .toList(),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: edlBloc.cameraPosList
                                            .map(
                                              (e) => e.alignment ==
                                                      Alignment.bottomCenter
                                                  ? InkWell(
                                                      onTap: () {
                                                        edlBloc.add(
                                                          SelectCameraPosEvent(
                                                            cameraPos: e,
                                                          ),
                                                        );
                                                      },
                                                      child: Transform.rotate(
                                                        angle:
                                                            e.rotation ?? 0.0,
                                                        child: Image.asset(
                                                          e.isActive ||
                                                                  e.hasPhoto
                                                              ? "${assetsImages}camera_active.png"
                                                              : "${assetsImages}camera_inactive.png",
                                                          width: 60,
                                                          height: 60,
                                                        ),
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                            )
                                            .toList(),
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
                                    "Prenez 8 photos extérieures",
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
                                    if (edlBloc.cameraPosList
                                        .where((e) => e.hasPhoto == false)
                                        .isEmpty) {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.edlPhotoList,
                                        arguments: TypePhotoArgs.exterior,
                                      );
                                      return;
                                    }
                                    final ImagePicker _picker = ImagePicker();
                                    // Pick an image
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      edlBloc.add(AddFileOfCameraPosEvent(
                                          file: File(image.path)));
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
    );
  }
}
