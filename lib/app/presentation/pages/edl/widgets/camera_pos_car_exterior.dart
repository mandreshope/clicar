import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class CameraPosCarExterior extends StatelessWidget {
  final bool isOnCamera;
  const CameraPosCarExterior({
    Key? key,
    this.isOnCamera = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final edlBloc = context.read<EdlBloc>();
    return BlocBuilder<EdlBloc, BaseState>(
      builder: (context, state) {
        return SizedBox(
          width: isOnCamera ? 50.w(context) : 70.w(context),
          height: isOnCamera ? 20.h(context) : 25.h(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: edlBloc.cameraPosList
                    .map(
                      (e) => e.alignment == Alignment.topCenter
                          ? Visibility(
                              visible: isOnCamera,
                              child: Visibility(
                                visible: e.isActive && e.hasPhoto == false,
                                child: InkWell(
                                  onTap: () {
                                    edlBloc.add(
                                      SelectCameraPosEvent(
                                        cameraPos: e,
                                      ),
                                    );
                                  },
                                  child: Transform.rotate(
                                    angle: e.rotation ?? 0.0,
                                    child: Image.asset(
                                      e.isActive || e.hasPhoto
                                          ? "${assetsImages}camera_active.png"
                                          : "${assetsImages}camera_inactive.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                                replacement: const SizedBox(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              replacement: InkWell(
                                onTap: () {
                                  edlBloc.add(
                                    SelectCameraPosEvent(
                                      cameraPos: e,
                                    ),
                                  );
                                },
                                child: Transform.rotate(
                                  angle: e.rotation ?? 0.0,
                                  child: Image.asset(
                                    e.isActive || e.hasPhoto
                                        ? "${assetsImages}camera_active.png"
                                        : "${assetsImages}camera_inactive.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //devant
                  ...edlBloc.cameraPosList
                      .map(
                        (e) => e.alignment == Alignment.centerLeft
                            ? Visibility(
                                visible: isOnCamera,
                                child: Visibility(
                                  visible: e.isActive && e.hasPhoto == false,
                                  child: InkWell(
                                    onTap: () {
                                      edlBloc.add(
                                        SelectCameraPosEvent(
                                          cameraPos: e,
                                        ),
                                      );
                                    },
                                    child: Transform.rotate(
                                      angle: e.rotation ?? 0.0,
                                      child: Image.asset(
                                        e.isActive || e.hasPhoto
                                            ? "${assetsImages}camera_active.png"
                                            : "${assetsImages}camera_inactive.png",
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  replacement: const SizedBox(
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                replacement: InkWell(
                                  onTap: () {
                                    edlBloc.add(
                                      SelectCameraPosEvent(
                                        cameraPos: e,
                                      ),
                                    );
                                  },
                                  child: Transform.rotate(
                                    angle: e.rotation ?? 0.0,
                                    child: Image.asset(
                                      e.isActive || e.hasPhoto
                                          ? "${assetsImages}camera_active.png"
                                          : "${assetsImages}camera_inactive.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      )
                      .toList(),
                  Visibility(
                    visible: isOnCamera,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        "${assetsImages}top_view_citadine.png",
                        width: 100,
                      ),
                    ),
                    replacement: Image.asset(
                      "${assetsImages}top_view_citadine.png",
                      width: 130,
                    ),
                  ),
                  ...edlBloc.cameraPosList
                      .map(
                        (e) => e.alignment == Alignment.centerRight
                            ? Visibility(
                                visible: isOnCamera,
                                child: Visibility(
                                  visible: e.isActive && e.hasPhoto == false,
                                  child: InkWell(
                                    onTap: () {
                                      edlBloc.add(
                                        SelectCameraPosEvent(
                                          cameraPos: e,
                                        ),
                                      );
                                    },
                                    child: Transform.rotate(
                                      angle: e.rotation ?? 0.0,
                                      child: Image.asset(
                                        e.isActive || e.hasPhoto
                                            ? "${assetsImages}camera_active.png"
                                            : "${assetsImages}camera_inactive.png",
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  replacement: const SizedBox(
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                replacement: InkWell(
                                  onTap: () {
                                    edlBloc.add(
                                      SelectCameraPosEvent(
                                        cameraPos: e,
                                      ),
                                    );
                                  },
                                  child: Transform.rotate(
                                    angle: e.rotation ?? 0.0,
                                    child: Image.asset(
                                      e.isActive || e.hasPhoto
                                          ? "${assetsImages}camera_active.png"
                                          : "${assetsImages}camera_inactive.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      )
                      .toList(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: edlBloc.cameraPosList.reversed
                    .map(
                      (e) => e.alignment == Alignment.bottomCenter
                          ? Visibility(
                              visible: isOnCamera,
                              child: Visibility(
                                visible: e.isActive && e.hasPhoto == false,
                                child: InkWell(
                                  onTap: () {
                                    edlBloc.add(
                                      SelectCameraPosEvent(
                                        cameraPos: e,
                                      ),
                                    );
                                  },
                                  child: Transform.rotate(
                                    angle: e.rotation ?? 0.0,
                                    child: Image.asset(
                                      e.isActive || e.hasPhoto
                                          ? "${assetsImages}camera_active.png"
                                          : "${assetsImages}camera_inactive.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                                replacement: const SizedBox(
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              replacement: InkWell(
                                onTap: () {
                                  edlBloc.add(
                                    SelectCameraPosEvent(
                                      cameraPos: e,
                                    ),
                                  );
                                },
                                child: Transform.rotate(
                                  angle: e.rotation ?? 0.0,
                                  child: Image.asset(
                                    e.isActive || e.hasPhoto
                                        ? "${assetsImages}camera_active.png"
                                        : "${assetsImages}camera_inactive.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
