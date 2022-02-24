import 'dart:io';
import 'dart:typed_data';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/data/sources/remote/remote_config.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/cubit/draggable_cubit.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/pages/edl/types/drag.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenshot/screenshot.dart';

class EdlDefectsExteriorPage extends StatefulWidget {
  const EdlDefectsExteriorPage({Key? key}) : super(key: key);

  @override
  State<EdlDefectsExteriorPage> createState() => _EdlDefectsExteriorPageState();
}

class _EdlDefectsExteriorPageState extends State<EdlDefectsExteriorPage> {
  final ScreenshotController screenshotController = ScreenshotController();

  final GlobalKey _widgetKey = GlobalKey();

  Offset _widgetOffset = Offset(0.0, 0.0);

  final ValueNotifier imgByte = ValueNotifier<Uint8List?>(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(_getWidgetInfo);
  }

  void _getWidgetInfo(_) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;
    _widgetKey.currentContext?.size;

    final Size size = renderBox.size;
    debugPrint('Size: ${size.width}, ${size.height}');

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    _widgetOffset = offset;
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
        child: BlocProvider(
          create: (context) => DraggableCubit(),
          child: BlocBuilder<EdlBloc, BaseState>(
            buildWhen: (prevState, currState) {
              if (currState is UploadPhotoDefectsExteriorSuccessState) {
                SnackBarWidget.show(
                  context: context,
                  message: "Photos defects exterior uploaded",
                  isError: false,
                );
                context.read<EdlBloc>().add(EdlPhotoDefectsEvent());
              } else if (currState is EdlPhotoDefectsSuccessState) {
                SnackBarWidget.show(
                  context: context,
                  message: "Contract mis à jour avec succès",
                  isError: false,
                );
                Navigator.of(context).pushNamed(
                  AppRoutes.edlDefectsExteriorNote,
                );
              } else if (currState.status == Status.error) {
                SnackBarWidget.show(
                    context: context,
                    message: currState.message,
                    isError: true);
              }
              return prevState != currState;
            },
            builder: (context, state) {
              final edlBloc = context.read<EdlBloc>();
              final typeVehicle =
                  edlBloc.contract.vehicle?.registration?.vehicleKind ?? "";
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

                          ///Photos exterior
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Draggable(
                                    data: edlBloc.typeEdl == TypeEdl.departure
                                        ? "${assetsImages}casse.png"
                                        : "${assetsImages}casse_retour.png",
                                    feedback: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: edlBloc.typeEdl ==
                                              TypeEdl.departure
                                          ? Image.asset(
                                              "${assetsImages}casse.png")
                                          : Image.asset(
                                              "${assetsImages}casse_retour.png"),
                                    ),
                                    onDragCompleted: () {},
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: edlBloc.typeEdl ==
                                              TypeEdl.departure
                                          ? Image.asset(
                                              "${assetsImages}casse.png")
                                          : Image.asset(
                                              "${assetsImages}casse_retour.png"),
                                    ),
                                  ),
                                  Text(
                                    "casse".toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                children: [
                                  Draggable(
                                    data: edlBloc.typeEdl == TypeEdl.departure
                                        ? "${assetsImages}rayure.png"
                                        : "${assetsImages}rayure_retour.png",
                                    feedback: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: edlBloc.typeEdl ==
                                              TypeEdl.departure
                                          ? Image.asset(
                                              "${assetsImages}rayure.png")
                                          : Image.asset(
                                              "${assetsImages}rayure_retour.png"),
                                    ),
                                    onDragCompleted: () {},
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: edlBloc.typeEdl ==
                                              TypeEdl.departure
                                          ? Image.asset(
                                              "${assetsImages}rayure.png")
                                          : Image.asset(
                                              "${assetsImages}rayure_retour.png"),
                                    ),
                                  ),
                                  Text(
                                    "rayure".toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                children: [
                                  Draggable(
                                    data: edlBloc.typeEdl == TypeEdl.departure
                                        ? "${assetsImages}choc.png"
                                        : "${assetsImages}choc_retour.png",
                                    feedback: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: edlBloc.typeEdl ==
                                              TypeEdl.departure
                                          ? Image.asset(
                                              "${assetsImages}choc.png")
                                          : Image.asset(
                                              "${assetsImages}choc_retour.png"),
                                    ),
                                    onDragCompleted: () {},
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: edlBloc.typeEdl ==
                                              TypeEdl.departure
                                          ? Image.asset(
                                              "${assetsImages}choc.png")
                                          : Image.asset(
                                              "${assetsImages}choc_retour.png"),
                                    ),
                                  ),
                                  Text(
                                    "choc".toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: CustomTheme.spacer,
                          ),
                          SizedBox(
                            key: _widgetKey,
                            height: 40.h(context),
                            width: 300.w(context),
                            // color: Colors.amber.withOpacity(0.5),
                            child: Screenshot(
                              controller: screenshotController,
                              child: DragTarget(
                                onAcceptWithDetails: (_) {
                                  final dragTargetDetails =
                                      (_ as DragTargetDetails);
                                  context.read<DraggableCubit>().addDrags(
                                        Drag(
                                          offset: Offset(
                                              dragTargetDetails.offset.dx -
                                                  _widgetOffset.dx,
                                              dragTargetDetails.offset.dy -
                                                  _widgetOffset.dy),
                                          url: dragTargetDetails.data,
                                        ),
                                      );
                                },
                                builder:
                                    (context, candidateItems, rejectedItems) {
                                  return Stack(
                                    children: [
                                      if (edlBloc.typeEdl ==
                                          TypeEdl.departure) ...[
                                        Center(
                                          child: Image.asset(
                                            typeVehicle.contains("Citadine")
                                                ? "${assetsImages}citadine_defeacts_exterior.png"
                                                : "${assetsImages}berline_defeacts_exterior.png",
                                          ),
                                        ),
                                      ] else ...[
                                        Center(
                                          child: Image.network(
                                            "${RemoteConfig.baseUrl}${edlBloc.contract.conditionAtStart?.faults?.first}",
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child: CircularProgress(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder: (context, _, __) {
                                              return Image.asset(
                                                "${assetsImages}citadine_defeacts_exterior.png",
                                              );
                                            },
                                          ),
                                        ),
                                        /*Center(
                                          child: Image.asset(
                                            "${assetsImages}citadine_defeacts_exterior.png",
                                          ),
                                        ),*/
                                      ],
                                      ...context
                                          .read<DraggableCubit>()
                                          .drags
                                          .map(
                                            (e) => Positioned(
                                              left: e.offset.dx,
                                              top: e.offset.dy,
                                              child: SizedBox(
                                                width: 20.0,
                                                height: 20.0,
                                                child: Image.asset(
                                                  e.url,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
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
                              onPressed: () async {
                                imgByte.value =
                                    await screenshotController.capture();

                                if (imgByte.value != null) {
                                  ///convert pngBytes to file
                                  final path = await localPath;
                                  File file =
                                      File('$path/edl_defects_exterior.png');
                                  file.writeAsBytesSync(
                                      List.from(imgByte.value!));

                                  edlBloc.add(
                                    UploadPhotoDefectsExteriorEvent(
                                      file: file,
                                    ),
                                  );
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
      ),
    );
  }
}
