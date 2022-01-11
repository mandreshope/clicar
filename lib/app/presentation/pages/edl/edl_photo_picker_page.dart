import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/scaffold_body.dart';
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdlPhotoPickerPage extends StatelessWidget {
  const EdlPhotoPickerPage({Key? key}) : super(key: key);

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
        child: BlocBuilder<SignatureBloc, BaseState>(
          buildWhen: (prevState, currState) {
            if (currState.status == Status.error) {
              SnackBarWidget.show(
                  context: context, message: currState.message, isError: true);
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
                            "photos extérieures".toUpperCase(),
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
                        SecondaryButton(
                          onPressed: () {},
                          height: 100,
                          width: double.infinity,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: CustomTheme.extraSpacer,
                        ),

                        ///Photos interior
                        SecondaryButton(
                          width: double.infinity,
                          child: Text(
                            "photos intérieures".toUpperCase(),
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
                        SecondaryButton(
                          onPressed: () {},
                          height: 100,
                          width: double.infinity,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: CustomTheme.spacer,
                        ),
                        PrimaryButton(
                          width: 40.w(context),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.edlDefectsExterior);
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
    );
  }
}
