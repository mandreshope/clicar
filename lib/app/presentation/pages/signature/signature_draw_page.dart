import 'dart:io';
import 'dart:typed_data';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/accept_contract/accept_contract_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';

import 'bloc/signature_bloc.dart';

class SignatureDrawPage extends StatelessWidget {
  SignatureDrawPage({Key? key}) : super(key: key);

  // Initialise a controller. It will contains signature points, stroke width and pen color.
// It will allow you to interact with the widget
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  final SignatureController _paraphes = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  final ValueNotifier imgByte = ValueNotifier<Uint8List?>(null);
  final ValueNotifier paraphesByte = ValueNotifier<Uint8List?>(null);
  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {
                _controller.undo();
              },
            ),
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: () {
                _controller.redo();
              },
            ),
            //CLEAR CANVAS
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
              },
            ),
          ],
        ),
        body: ScaffoldBody(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 05.h(context).sp(context),
                    horizontal: 10.w(context).sp(context),
                  ),
                  child: Column(
                    children: [
                      const TitleWithSeparator(title: "Paraphes"),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      BlocBuilder<AcceptContractBloc, BaseState>(
                        buildWhen: (prevState, currState) {
                          return currState is AcceptParapheState;
                        },
                        builder: (context, state) {
                          return CheckboxListTile(
                            activeColor: CustomTheme.primaryColor,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.all(0.0),
                            value: state is AcceptParapheState
                                ? state.isAccepted
                                : false,
                            onChanged: (v) {
                              context
                                  .read<AcceptContractBloc>()
                                  .add(AcceptParapheEvent(isAccepted: v!));
                            },
                            title: Text(
                              "Lu et approuvé",
                              style: TextStyle(
                                fontSize: CustomTheme.subtitle2.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      ContainerRoundedGrey(
                        child: Signature(
                          controller: _paraphes,
                          width: 300,
                          height: 40.h(context),
                          backgroundColor: CustomTheme.greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      const TitleWithSeparator(title: "Signature"),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      BlocBuilder<AcceptContractBloc, BaseState>(
                        buildWhen: (prevState, currState) {
                          return currState is AcceptContractState;
                        },
                        builder: (context, state) {
                          return CheckboxListTile(
                            activeColor: CustomTheme.primaryColor,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.all(0.0),
                            value: state is AcceptContractState
                                ? state.isAccepted
                                : false,
                            onChanged: (v) {
                              context
                                  .read<AcceptContractBloc>()
                                  .add(AcceptContractEvent(isAccepted: v!));
                            },
                            title: Text(
                              "Bon pour accord",
                              style: TextStyle(
                                fontSize: CustomTheme.subtitle2.sp(context),
                                color: CustomTheme.primaryColor,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      ContainerRoundedGrey(
                        child: Signature(
                          controller: _controller,
                          width: 300,
                          height: 40.h(context),
                          backgroundColor: CustomTheme.greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: CustomTheme.spacer,
                      ),
                      BlocBuilder<SignatureBloc, BaseState>(
                        buildWhen: (prevState, currState) {
                          if (currState.status == Status.uploadFileSuccess) {
                            context.read<SignatureBloc>().add(
                                  SignContractEvent(
                                    isAccepted:
                                        (currState as DownloadFileSuccessState)
                                            .isAccepted,
                                    contract:
                                        context.read<SignatureBloc>().contract,
                                    reservation: context
                                        .read<SignatureBloc>()
                                        .reservation,
                                    bdc: context.read<SignatureBloc>().bdc,
                                    uploadFile: context
                                        .read<SignatureBloc>()
                                        .uploadFile,
                                  ),
                                );
                          } else if (currState.status ==
                              Status.uploadFileFailed) {
                            SnackBarWidget.show(
                              context: context,
                              message: currState.message,
                              isError: true,
                            );
                          } else if (currState.status ==
                              Status.contractAccepted) {
                            SnackBarWidget.show(
                              context: context,
                              message: currState.message,
                              isError: false,
                            );
                          } else if (currState.status == Status.signed) {
                            final acceptContractBloc =
                                BlocProvider.of<AcceptContractBloc>(context);
                            acceptContractBloc.add(
                                const AcceptContractEvent(isAccepted: false));
                            acceptContractBloc.add(
                                const AcceptParapheEvent(isAccepted: false));
                            Navigator.of(context).pushNamed(
                                AppRoutes.signatureDetail,
                                arguments: imgByte);
                            SnackBarWidget.show(
                              context: context,
                              message: "Signature enregistré avec succès",
                              isError: false,
                            );
                          } else if (currState is ErrorState) {
                            SnackBarWidget.show(
                              context: context,
                              message: currState.message,
                              isError: true,
                            );
                          }
                          return prevState != currState;
                        },
                        builder: (context, state) {
                          return Visibility(
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
                                final acceptContractBloc =
                                    BlocProvider.of<AcceptContractBloc>(
                                        context);
                                if (_controller.isNotEmpty &&
                                    _paraphes.isNotEmpty) {
                                  imgByte.value =
                                      await _controller.toPngBytes();
                                  paraphesByte.value =
                                      await _paraphes.toPngBytes();
                                  if (paraphesByte.value != null &&
                                      imgByte.value != null &&
                                      acceptContractBloc.isAcceptContract &&
                                      acceptContractBloc.isAcceptParah) {
                                    ///convert pngBytes to file
                                    final path = await localPath;
                                    File file = File('$path/signature.png');
                                    File paraphe = File('$path/paraphes.png');
                                    file.writeAsBytesSync(
                                        List.from(imgByte.value!));
                                    paraphe.writeAsBytesSync(
                                        List.from(paraphesByte.value!));
                                    context.read<SignatureBloc>().add(
                                        UploadSignatureFileEvent(
                                            file: file,
                                            paraphes: paraphe,
                                            isAccepted: (state
                                                    as DownloadFileSuccessState)
                                                .isAccepted,
                                            contract: context
                                                .read<SignatureBloc>()
                                                .contract));
                                  } else {
                                    if (!acceptContractBloc.isAcceptContract) {
                                      SnackBarWidget.show(
                                        isError: true,
                                        message:
                                            "Vous devez accepter le contrat svp",
                                        context: context,
                                      );
                                    } else if (!acceptContractBloc
                                        .isAcceptParah) {
                                      SnackBarWidget.show(
                                        isError: true,
                                        message:
                                            "Vous devez lire et approuver le contrat svp",
                                        context: context,
                                      );
                                    }
                                  }
                                } else {
                                  SnackBarWidget.show(
                                    isError: true,
                                    message: "Votre signature svp !",
                                    context: context,
                                  );
                                }
                              },
                              child: Text(
                                'Signer',
                                style: TextStyle(
                                  fontSize: CustomTheme.button.sp(context),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
