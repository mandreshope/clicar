import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  final Widget child;
  const ScaffoldBody({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: CustomTheme.primaryColor,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: CustomTheme.radius,
              topRight: CustomTheme.radius,
            ),
            color: Colors.white,
          ),
        ),
        child,
        const Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: BottomLogo(),
        )
      ],
    );
  }
}
