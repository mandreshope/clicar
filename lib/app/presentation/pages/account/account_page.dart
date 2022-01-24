import 'dart:io';

import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/responsive.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/auth_listener_widget.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/account/account_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              color: CustomTheme.primaryColor,
              width: double.infinity,
              height: double.infinity,
              child: SizedBox(
                height: Responsive.height(context) -
                    (Responsive.height(context) * 0.75),
                child: BlocBuilder<UserBloc, BaseState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Avatar(
                          url: state is MeUserState ? state.user.photo : null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          state is MeUserState
                              ? state.user.username.toString()
                              : "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: CustomTheme.subtitle1.sp(context),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state is MeUserState ? state.user.email ?? "-" : "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: CustomTheme.subtitle1.sp(context),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.75,
              minChildSize: 0.75,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: CustomTheme.radius,
                      topRight: CustomTheme.radius,
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 05.h(context).sp(context),
                            horizontal: 10.w(context).sp(context),
                          ),
                          child: Column(
                            children: [
                              const TitleWithSeparator(title: "Menu"),
                              const SizedBox(
                                height: 30,
                              ),
                              BlocBuilder<AccountBloc, BaseState>(
                                buildWhen: (prevState, currState) {
                                  if (currState.status ==
                                      Status.uploadFileSuccess) {
                                    SnackBarWidget.show(
                                      context: context,
                                      message: "Uploaded",
                                      isError: false,
                                    );
                                    context.read<AccountBloc>().add(
                                        UserAddPhotoEvent(
                                            id: context
                                                    .read<UserBloc>()
                                                    .currentUser
                                                    ?.id ??
                                                ''));
                                  } else if (currState
                                      is UserAddPhotoSuccessState) {
                                    SnackBarWidget.show(
                                      context: context,
                                      message:
                                          "La photo de profil a été modifiée.",
                                      isError: false,
                                    );
                                    context.read<UserBloc>().add(MeUserEvent());
                                  } else if (currState.status ==
                                      Status.uploadFileFailed) {
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
                                    child: SecondaryButton(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const CircularProgress(
                                            color: CustomTheme.primaryColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Importation...',
                                            style: CustomTheme.mainBtnTextStyle
                                                .copyWith(
                                              fontSize: CustomTheme
                                                  .mainBtnTextStyle.fontSize
                                                  ?.sp(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    replacement: SecondaryButton(
                                      width: double.infinity,
                                      child: Text(
                                        'Importer une photo',
                                        style: CustomTheme.mainBtnTextStyle
                                            .copyWith(
                                          fontSize: CustomTheme
                                              .mainBtnTextStyle.fontSize
                                              ?.sp(context),
                                        ),
                                      ),
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
                                          final file = File(image.path);
                                          if (fileSize(file) >= 2.0) {
                                            SnackBarWidget.show(
                                                context: context,
                                                message:
                                                    "2 Mo la taille de fichier maximale pour le téléversement !",
                                                isError: true);
                                            return;
                                          }
                                          context.read<AccountBloc>().add(
                                              UploadUserPhotoFileEvent(
                                                  file: file));
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              SecondaryButton(
                                width: double.infinity,
                                child: Text(
                                  'Changer de mot de passe',
                                  style: CustomTheme.mainBtnTextStyle.copyWith(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.userChangePassword);
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              SecondaryButton(
                                width: double.infinity,
                                child: Text(
                                  'Mes informations',
                                  style: CustomTheme.mainBtnTextStyle.copyWith(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.userInfo);
                                },
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(UserLogOutEvent());
                                },
                                child: Text(
                                  "se déconnecter".toUpperCase(),
                                  style: TextStyle(
                                    color: CustomTheme.primaryColor,
                                    fontSize: CustomTheme.bodyText1.sp(context),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            //footer
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: BottomLogo(),
            )
          ],
        ),
      ),
    );
  }
}
