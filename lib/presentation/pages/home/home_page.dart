import 'package:clicar/core/routes/app_pages.dart';
import 'package:clicar/core/utils/responsive.dart';
import 'package:clicar/core/utils/theme.dart';
import 'package:clicar/presentation/pages/home/bloc/user_bloc.dart';
import 'package:clicar/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:clicar/core/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(MeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (prevState, currState) {
              if (currState is NotLoggedState) {
                WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Routes.login, (route) => false);
                });
              }
              return true;
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.account);
                },
                icon: const Icon(
                  Icons.settings,
                ),
              );
            },
          ),
        ],
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
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const Avatar(),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        state is MeState ? state.user.username.toString() : "-",
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
                        state is MeState ? state.user.email ?? "-" : "-",
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
            builder: (BuildContext context, ScrollController scrollController) {
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
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Signature des contrats',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Réaliser un départ',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Réaliser un retour',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Joindre des documents',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
                            ),
                            SecondaryButton(
                              width: double.infinity,
                              child: Text(
                                'Consulter les statistiques',
                                style: CustomTheme.mainBtnTextStyle.copyWith(
                                  fontSize: CustomTheme
                                      .mainBtnTextStyle.fontSize
                                      ?.sp(context),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox(
                              height: CustomTheme.spacer,
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
    );
  }
}
