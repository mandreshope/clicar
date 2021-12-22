import 'package:clicar/app/core/routes/app_pages.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/responsive.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is NotLoggedState) {
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.login, (route) => false);
          });
        }
      },
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
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const Avatar(),
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
                              SecondaryButton(
                                width: double.infinity,
                                child: Text(
                                  'Importer une photo',
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
                                  'Changer de mote de passe',
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
                                  'Mes informations',
                                  style: CustomTheme.mainBtnTextStyle.copyWith(
                                    fontSize: CustomTheme
                                        .mainBtnTextStyle.fontSize
                                        ?.sp(context),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.userInfo);
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
