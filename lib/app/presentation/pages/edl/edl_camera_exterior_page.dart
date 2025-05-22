// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_photo_args.dart';
import 'package:clicar/app/presentation/pages/edl/widgets/camera_pos_car_exterior.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'dart:math' as math;

class EdlCameraExteriorPage extends StatefulWidget {
  const EdlCameraExteriorPage({Key? key}) : super(key: key);

  @override
  _EdlCameraExteriorPageState createState() {
    return _EdlCameraExteriorPageState();
  }
}

void logError(String code, String? message) {
  if (message != null) {
    print('Error: $code\nError Message: $message');
  } else {
    print('Error: $code');
  }
}

class _EdlCameraExteriorPageState extends State<EdlCameraExteriorPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? controller;
  XFile? imageFile;

  FlashMode flashMode = FlashMode.off;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late EdlBloc edlBloc;

  @override
  void initState() {
    super.initState();
    _ambiguate(WidgetsBinding.instance)?.addObserver(this);

    edlBloc = context.read<EdlBloc>();

    onNewCameraSelected(cameras
        .where((e) => e.lensDirection == CameraLensDirection.back)
        .first);
  }

  @override
  void dispose() {
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        /*final bool? confirm = await showDialog<bool?>(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) => const ConfirmDialog(
            title: "Voulez-vous annuler ?",
          ),
        );
        if (confirm == true) {
          context.read<EdlBloc>().resetUploadPhoto();
          return Future.value(true);
        } else {
          return false;
        }*/
        return Future.value(true);
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            _cameraPreviewWidget(),
            const Positioned(
              top: 10.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                  child: SafeArea(
                child: CameraPosCarExterior(
                  isOnCamera: true,
                ),
              )),
            ),
            Positioned(
              bottom: 10,
              left: 10.0,
              child: SizedBox(
                height: 80.0,
                child: IconButton(
                  onPressed: () {
                    if (flashMode == FlashMode.off) {
                      flashMode = FlashMode.always;
                    } else {
                      flashMode = FlashMode.off;
                    }
                    onSetFlashModeButtonPressed(flashMode);
                  },
                  icon: controller?.value.flashMode == FlashMode.off
                      ? const Icon(
                          Icons.flash_on,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.flash_off,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: PrimaryButton(
                  onPressed: onTakePictureButtonPressed,
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
            Positioned(
              bottom: 10,
              right: 10.0,
              child: SizedBox(
                height: 80.0,
                child: PrimaryButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: Colors.transparent,
                  child: const Text(
                    "Fermer",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Center(child: CircularProgress());
    } else {
      // fetch screen size
      final size = MediaQuery.of(context).size;

      // calculate scale depending on screen and camera ratios
      // this is actually size.aspectRatio / (1 / camera.aspectRatio)
      // because camera preview size is received as landscape
      // but we're calculating for portrait orientation
      var scale = size.aspectRatio * (controller?.value.aspectRatio ?? 0);

      // to prevent scaling down, invert the value
      if (scale < 1) scale = 1 / scale;
      return Center(
        child: Transform.scale(
          scale: scale,
          child: CameraPreview(controller!),
        ),
      );
    }
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void showInSnackBar(String message) {
    // ignore: deprecated_member_use
    // _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
      enableAudio: false,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) setState(() {});
      if (cameraController.value.hasError) {
        showInSnackBar(
            'Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void onTakePictureButtonPressed() {
    if(controller !=null  && !controller!.value.isInitialized) {
      print("not initialize");
    }
    if (edlBloc.cameraPosList.where((e) => e.hasPhoto == false).isEmpty) {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.edlPhotoList,
        arguments: TypePhotoArgs.exterior,
      );
      return;
    }
    takePicture().then((XFile? file) {
      if (mounted) {
        if (file != null) {
          edlBloc.add(AddFileOfCameraPosEvent(file: File(file.path)));
        }
      }
    });
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) setState(() {});
      showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }
}

List<CameraDescription> cameras = [];

/// This allows a value of type T or T? to be treated as a value of type T?.
///
/// We use this so that APIs that have become non-nullable can still be used
/// with `!` and `?` on the stable branch.
// TODO(ianh): Remove this once we roll stable in late 2021.
T? _ambiguate<T>(T? value) => value;
