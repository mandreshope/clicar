import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/edl/cubit/draggable_cubit.dart';
import 'package:clicar/app/presentation/pages/edl/enums/defects_exterior_note_args.dart';
import 'package:clicar/app/presentation/pages/edl/widgets/drag.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
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
    debugPrint('Offset: ${offset.dx}, ${offset.dy}');
    debugPrint(
        'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
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
          child: BlocBuilder<SignatureBloc, BaseState>(
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
                          TitleWithSeparator(title: "Départ".toUpperCase()),
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
                                    data: "${assetsImages}casse.png",
                                    feedback: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                          "${assetsImages}casse.png"),
                                    ),
                                    onDragCompleted: () {},
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          "${assetsImages}casse.png"),
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
                                    data: "${assetsImages}rayure.png",
                                    feedback: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                          "${assetsImages}rayure.png"),
                                    ),
                                    onDragCompleted: () {},
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          "${assetsImages}rayure.png"),
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
                                    data: "${assetsImages}choc.png",
                                    feedback: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                          "${assetsImages}choc.png"),
                                    ),
                                    onDragCompleted: () {},
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(
                                          "${assetsImages}choc.png"),
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
                                      Center(
                                        child: Image.asset(
                                          "${assetsImages}citadine_defeacts_exterior.png",
                                        ),
                                      ),
                                      ...context
                                          .read<DraggableCubit>()
                                          .drags
                                          .map(
                                            (e) => Positioned(
                                              left: e.offset.dx,
                                              top: e.offset.dy,
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
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

                          PrimaryButton(
                            width: 40.w(context),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.edlDefectsExteriorNote,
                                arguments: DefectsExteriorNoteArgs.departure,
                              );
                            },
                            child: Text(
                              'Suivant'.toUpperCase(),
                              style: TextStyle(
                                fontSize: CustomTheme.button.sp(context),
                                color: Colors.white,
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
