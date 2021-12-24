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
import 'package:clicar/app/presentation/widgets/snack_bar_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignaturePage extends StatelessWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthListenerWidget(
      child: Scaffold(
        backgroundColor: CustomTheme.primaryColor,
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
        body: Stack(
          children: [
            DraggableScrollableSheet(
              initialChildSize: 1.0,
              minChildSize: 1.0,
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
                              const TitleWithSeparator(title: "Signature"),
                              const SizedBox(
                                height: 30,
                              ),
                              ExpandableNotifier(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: CustomTheme.greyColor,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      ScrollOnExpand(
                                        scrollOnExpand: true,
                                        scrollOnCollapse: false,
                                        child: ExpandablePanel(
                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            tapBodyToCollapse: true,
                                          ),
                                          header: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Text(
                                                'Contrats à signer'
                                                    .toUpperCase(),
                                                style: CustomTheme
                                                    .mainBtnTextStyle
                                                    .copyWith(
                                                  color:
                                                      CustomTheme.primaryColor,
                                                  fontSize: CustomTheme
                                                      .mainBtnTextStyle.fontSize
                                                      ?.sp(context),
                                                ),
                                              )),
                                          collapsed: const SizedBox.shrink(),
                                          expanded: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              const SearchTextFieldUnderlined(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              for (var _
                                                  in Iterable.generate(10))
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed(AppRoutes
                                                            .signatureSummary);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 5),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Contrat N° 14564",
                                                          style: TextStyle(
                                                              fontSize: CustomTheme
                                                                  .subtitle2
                                                                  .sp(context),
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "Sté GAMMA DRIVER",
                                                          style: TextStyle(
                                                              fontSize: CustomTheme
                                                                  .subtitle2
                                                                  .sp(context),
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "Toyota",
                                                          style: TextStyle(
                                                            fontSize: CustomTheme
                                                                .subtitle2
                                                                .sp(context),
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          "FLSZEEE",
                                                          style: TextStyle(
                                                            fontSize: CustomTheme
                                                                .subtitle2
                                                                .sp(context),
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          "EDL prevu le 12/12/21",
                                                          style: TextStyle(
                                                            fontSize: CustomTheme
                                                                .subtitle2
                                                                .sp(context),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: CustomTheme
                                                                .secondaryColor,
                                                          ),
                                                        ),
                                                        const Divider(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          builder: (_, collapsed, expanded) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                              ),
                                              child: Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme:
                                                    const ExpandableThemeData(
                                                        crossFadePoint: 0),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
      ),
    );
  }
}
