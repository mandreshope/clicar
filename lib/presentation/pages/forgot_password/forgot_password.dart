import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/injection_container.dart';
import 'package:clicar/presentation/pages/login/bloc/login_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clicar/core/utils/extension.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => sl<LoginBloc>(),
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
              child: Column(
                children: [
                  SizedBox(
                    height: Responsive.height(context) -
                        (Responsive.height(context) * .5),
                    child: Center(
                      child: Image.asset(
                        "${assetsImages}clicar_logo.png",
                        scale: 5.sp(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 05.h(context).sp(context),
                            horizontal: 10.w(context).sp(context),
                          ),
                          child: Column(
                            children: [
                              const TitleWithSeparator(
                                  title: "Mot de passe oublié ?"),
                              const SizedBox(
                                height: 30,
                              ),
                              const TextFieldFilled(
                                labelText: 'username',
                              ),
                              const SizedBox(
                                height: CustomTheme.spacer,
                              ),
                              PrimaryButton(
                                onPressed: () {},
                                height: 50.0,
                                width: 40.w(context),
                                child: Text(
                                  'Valider',
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
